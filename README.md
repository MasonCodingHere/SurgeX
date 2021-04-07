# SurgeX——A Lightweight Web Server Based On C++
[![Build Status](https://travis-ci.com/mrxuxg/SurgeX.svg?branch=master)](https://travis-ci.com/mrxuxg/SurgeX) ![GitHub](https://img.shields.io/github/license/mrxuxg/SurgeX)
## Introduction
SurgeX是一款使用C++11编写的轻量级Web服务器，目前支持解析GET、HEAD请求，可处理静态资源，支持HTTP长连接和管线化请求，并实现了异步日志以记录服务器运行状态。
## Environment
- OS：CentOS  7.5
- Complier：g++ 4.8
- CMake：version 3.19.6
- Make：GNU Make 3.82
- Shell：GNU bash, version 4.2.46
## Usage
### Clone
```shell
git clone https://github.com/mrxuxg/SurgeX.git
```
### Build
```shell
cd SurgeX
./build.sh
```
### Run
```shell
./SurgeX [-t thread_numbers] [-p port] [-l log_file_path(should begin with '/')]
```
## Technical points
- 使用Epoll边沿触发的IO多路复用技术，非阻塞IO，使用Reactor模式。
- 使用多线程充分利用多核CPU，并使用线程池避免线程频繁创建销毁的开销。
- 使用基于小根堆的定时器关闭超时请求。
- 主线程只负责accept请求，并以Round Robin的方式分发给其它IO线程(兼计算线程)，锁的争用只会出现在主线程和某一特定线程中。
- 使用eventfd实现了线程的异步唤醒。
- 使用双缓冲区技术实现了简单的异步日志系统。
- 为减少内存泄漏的可能，使用智能指针等RAII机制。
- 使用状态机解析了HTTP请求,支持管线化请求。
- 支持优雅关闭连接。  
## Model
并发模型为Reactor+非阻塞IO+线程池，新连接Round Robin分配。
