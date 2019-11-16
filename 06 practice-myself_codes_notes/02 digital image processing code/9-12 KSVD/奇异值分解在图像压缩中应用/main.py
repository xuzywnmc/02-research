import os
import MyDataset
import torch
import torch.nn
from torch.autograd import Variable
from torch.utils.data import DataLoader
from torchvision import datasets
from torchvision import transforms
import time

# cuda=False
cuda=torch.cuda.is_available()
start=time.time()

learning_rate=0.01
epoch_n=5
batch_n=64

def get_Variabel(x):
    x=Variable(x)
    return x
def get_Variabel_cuda(x):
    x=Variable(x).cuda()
    return x


train_data=datasets.MNIST(root="./data/da",
                  transform=transforms.ToTensor(),
                  train=True,
                  download=True
                          )
# test_data=datasets.MNIST(root="./data/da",
#                 transform=transforms.ToTensor(),
#                 train=False,
#                 download=True
#                           )

test_data=MyDataset.MyDataset(root="mnist_test.txt",transform=transforms.ToTensor())

train_loader=DataLoader(dataset=train_data,batch_size=batch_n,shuffle=True)
test_loader=DataLoader(dataset=test_data,batch_size=batch_n,shuffle=True)

class My_FC(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self.fc=torch.nn.Sequential(torch.nn.Linear(28*28*1,300),
                                    torch.nn.ReLU(),
                                    torch.nn.Linear(300,100),
                                    torch.nn.ReLU(),
                                    torch.nn.Linear(100,10))
    def forward(self, x):
        x=x.view(x.size(0),-1)
        y_out=self.fc(x)
        return y_out


fc=My_FC()

class My_CNN(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self.conv1=torch.nn.Sequential(
            torch.nn.Conv2d(1,16,kernel_size=5,padding=2),
            torch.nn.ReLU(),
            torch.nn.MaxPool2d(2)
        )
        self.conv2=torch.nn.Sequential(
            torch.nn.Conv2d(16,32,kernel_size=5,padding=2),
            torch.nn.ReLU(),
            torch.nn.MaxPool2d(2)
        )
        self.fc=torch.nn.Linear(7*7*32,10)

    def forward(self,x):
        conv