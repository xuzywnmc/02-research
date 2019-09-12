// mallat.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include "pch.h"
#include <iostream>

int main()
{
    std::cout << "Hello World!\n"; 
}

// 运行程序: Ctrl + F5 或调试 >“开始执行(不调试)”菜单
// 调试程序: F5 或调试 >“开始调试”菜单

// 入门提示: 
//   1. 使用解决方案资源管理器窗口添加/管理文件
//   2. 使用团队资源管理器窗口连接到源代码管理
//   3. 使用输出窗口查看生成输出和其他消息
//   4. 使用错误列表窗口查看错误
//   5. 转到“项目”>“添加新项”以创建新的代码文件，或转到“项目”>“添加现有项”以将现有代码文件添加到项目
//   6. 将来，若要再次打开此项目，请转到“文件”>“打开”>“项目”并选择 .sln 文件
int Upsampling(double* data, int n, double result[])
{
	int i;

	for (i = 0; i < n; i++)
	{
		result[2 * i] = data[i];
		result[2 * i + 1] = 0;
	}

	return(2 * n);
}

/**
 * @brief 边缘延拓
 * @param typeId 延拓数据的类型，1D or 2D
 * @param modeId 延拓方式：对称、周期
 * @param in 输入数据
 * @param inLen 输入数据的长度
 * @param filterLen 小波基滤波器长度
 * @param out 返回结果数组
 * @return 返回结果数组长度
 */
int SignalExtension(int typeId,
	int modeId,
	double *in,
	int inLen,
	int filterLen,
	double out[])
{
	if ((NULL == in) || (NULL == out))
		return -1;
	if (0 != typeId) // 目前只支持一种模型  
		return -1;
	//if(0 != modeId) // 目前只支持一种模型，信号对称拓延  'sym' or 'symh'      Symmetric-padding (half-point): boundary value symmetric replication  
	//  return -1;  
	if (inLen < filterLen) // inLen should lager than or equal extendLen, otherwise no extension  
		return -1;

	int i;
	int extendLen = filterLen - 1;

	if (0 == modeId) // 信号对称拓延  
	{
		for (i = 0; i < inLen; i++)
		{
			out[extendLen + i] = in[i];
		}
		for (i = 0; i < extendLen; i++)
		{
			out[i] = out[2 * extendLen - i - 1];       // 左边沿对称延拓  
			out[inLen + extendLen + i] = out[extendLen + inLen - i - 1]; // 右边沿对称延拓  
		}

		return inLen + 2 * extendLen;
	}
	else if (1 == modeId) // 信号周期拓延  
	{
		for (i = 0; i < extendLen; i++)
			out[i] = in[inLen - extendLen + i];
		for (i = 0; i < inLen; i++)
			out[extendLen + i] = in[i];

		return inLen + extendLen;
	}

}

/**
 * @brief 上采样  隔点插0
 * @param data 输入数据指针
 * @param n 输入数据长度
 * @param result 返回结果数组
 * @return 返回结果数组长度
 */
int Upsampling(double* data, int n, double result[])
{
	int i;

	for (i = 0; i < n; i++)
	{
		result[2 * i] = data[i];
		result[2 * i + 1] = 0;
	}

	return(2 * n);
}

/**
 * @brief 下采样  隔点采样
 * @param data 输入数据指针
 * @param n 输入数据长度
 * @param result 返回结果数组
 * @return 返回结果数组长度
 */
int Downsampling(double* data, int n, double result[])
{
	int i, m;

	m = n / 2;
	for (i = 0; i < m; i++)
		result[i] = data[i * 2 + 1];

	return(m);
}

/**
 * @brief 卷积运算
 * @param shapeId 卷积结果处理方式
 * @param double *inSignal, int signalLen, // 输入信号及其长度
 * @param double *inFilter, int filterLen, // 输入滤波器及其长度
 * @param double outConv[], int *convLen)   // 输出卷积结果及其长度
 * @return
 */
void Conv1(int shapeId,                  // 卷积结果处理方式  
	double *inSignal, int signalLen, // 输入信号及其长度  
	double *inFilter, int filterLen, // 输入滤波器及其长度  
	double outConv[], int *convLen)   // 输出卷积结果及其长度  
{
	if ((NULL == inSignal) || (NULL == inFilter) || (NULL == outConv))
		return;

	int n, k, kmin, kmax, p;
	if (0 == shapeId)      // 对于MATLAB conv(...,'shape')  -----full  
	{
		*convLen = signalLen + filterLen - 1;
		for (n = 0; n < *convLen; n++)
		{
			outConv[n] = 0;

			kmin = (n >= filterLen - 1) ? n - (filterLen - 1) : 0;
			kmax = (n < signalLen - 1) ? n : signalLen - 1;

			for (k = kmin; k <= kmax; k++)
			{
				outConv[n] += inSignal[k] * inFilter[n - k];
			}
		}
	}
	else if (1 == shapeId) // 对于MATLAB conv(...,'shape')  -----valid  
	{
		*convLen = signalLen - filterLen + 1;
		for (n = filterLen - 1; n < signalLen; n++)
		{
			p = n - filterLen + 1;
			outConv[p] = 0;

			kmin = (n >= filterLen - 1) ? n - (filterLen - 1) : 0;
			kmax = (n < signalLen - 1) ? n : signalLen - 1;

			for (k = kmin; k <= kmax; k++)
			{
				outConv[p] += inSignal[k] * inFilter[n - k];
			}
		}
	}
	else
		return;

}

/**
 * @brief 小波变换之分解
 * @param sourceData 源数据
 * @param dataLen 源数据长度
 * @param db 过滤器类型
 * @param cA 分解后的近似部分序列-低频部分
 * @param cD 分解后的细节部分序列-高频部分
 * @return 正常则返回分解后序列的数据长度，错误则返回-1
 */
int Wavelet::Decomposition(double* sourceData, int dataLen, Filter db, double* cA, double* cD)
{
	if (dataLen < 2)
		return -1;
	if ((NULL == sourceData) || (NULL == cA) || (NULL == cD))
		return -1;

	m_db = db;
	int filterLen = m_db.length;
	int i, n;
	int decLen = (dataLen + filterLen - 1) / 2;
	int convLen = 0;
	double extendData[dataLen + 2 * filterLen - 2];
	double convDataLow[dataLen + filterLen - 1];
	double convDataHigh[dataLen + filterLen - 1];

	/*
	MATLAB上dwt函数的工作过程
	假设x=[x(1) x(2) x(3) x(4) x(5) x(6) x(7)],计算y=dwt(x,’db2’)。
	其计算过程主要由两个部分组成：
	1：边缘延拓，它主要由函数wextend完成。
	2：卷积运算，它主要由函数conv2完成。
	先看第一部分，仔细分析子程序部分，函数wextend的用法为y=wextend('1D','sym',x,3);
	这样得到的y=[ x(3) x(2) x(1) x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(7) x(6) x(5)]
	在看第二部分，仔细分析子程序部分，核心语句有z=conv2(y,Lo_D,'valid');
	这里设Lo_D=[h(1) h(2) h(3) h(4)]。
	3：最后就是下采样，其下采样是按照式a = z(2:2:length(z))进行的，高频低频部分均如此，项数为floor（(7+4-1)/2）。
	 */
	 // 1.边缘延拓  
	SignalExtension(0, 0, sourceData, dataLen, filterLen, extendData);

	// 2.卷积运算  
	Conv1(1, extendData, dataLen + 2 * filterLen - 2, db.lowFilterDec, filterLen, convDataLow, &convLen);
	Conv1(1, extendData, dataLen + 2 * filterLen - 2, db.highFilterDec, filterLen, convDataHigh, &convLen);

	// 3.下采样  
	Downsampling(convDataLow, dataLen + filterLen - 1, cA);
	Downsampling(convDataHigh, dataLen + filterLen - 1, cD);

	return decLen;
}

/**
 * @brief 小波变换之重构
 * @param cA 分解后的近似部分序列-低频部分
 * @param cD 分解后的细节部分序列-高频部分
 * @param cALength 输入数据长度
 * @param RecLength 输入重构后的原始数据长度
 * @param db 过滤器类型
 * @param recData 重构后输出的数据
 * @return 正常则返回重构数据长度，错误则返回-1
 */
int Wavelet::Reconstruction(double *cA, double *cD, int cALength, int RecLength, Filter db, double* recData)
{
	if ((NULL == cA) || (NULL == cD) || (NULL == recData))
		return -1;

	m_db = db;
	int filterLen = m_db.length;

	int i, j;
	int n, k, p;
	int recLen = RecLength;

	int convLen = 0;
	double convDataLow[recLen + filterLen - 1];
	double convDataHigh[recLen + filterLen - 1];

	double cATemp[2 * cALength];
	double cDTemp[2 * cALength];

	memset(convDataLow, 0, (recLen + filterLen - 1) * sizeof(double)); // 清0  
	memset(convDataHigh, 0, (recLen + filterLen - 1) * sizeof(double)); // 清0  
	memset(cATemp, 0, 2 * cALength * sizeof(double)); // 清0  
	memset(cDTemp, 0, 2 * cALength * sizeof(double)); // 清0  

	// 1.隔点插0  
	Upsampling(cA, cALength, cATemp);
	Upsampling(cD, cALength, cDTemp);

	// 2.卷积运算  
	Conv1(0, cATemp, 2 * cALength - 1, db.lowFilterRec, filterLen, convDataLow, &convLen);
	convLen = 0;
	Conv1(0, cDTemp, 2 * cALength - 1, db.highFilterRec, filterLen, convDataHigh, &convLen);

	// 3.抽取结果及求和——实现类似MATLAB中的wkeep1(s,len,'c')的功能  
	k = (convLen - recLen) / 2;
	for (i = 0; i < recLen; i++)
	{
		recData[i] = convDataLow[i + k] + convDataHigh[i + k];
	}

	return recLen;
}
