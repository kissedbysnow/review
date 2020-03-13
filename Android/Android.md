## 一、Android 概述

### 1.3 Android 应用程序构成

- 活动 **Activity**
  - 一个活动就是一个单独的屏幕
- 服务 **Service**
  - 具有较长生命周期，没有用户界面的程序
  - 运行在后台，可以与其它程序进行交互
  - 不能独立运行，需要通过 Activity 来调用
- 广播接收器 **Broadcast Receiver**
  - 一个广播接收器不做什么事情，仅是接受广播公告并作出相应的响应
  - Android 中的广播要么来自于**系统**，要么来自**普通应用程序**
  - 为了响应不同的事件通知，一个应用程序可以注册任意数量的广播接收器
  - 所有的广播接收器都继承自基类 **BroadcastReceiver**
- 内容提供器 **Content Provider**
  - Android 应用程序可以使用文件或 SQLite 数据库来存储数据
  - Content Provider 提供了一种多应用间数据共享的方式
- 意图 **Intent**
  - 用来描述应用程序的功能
  - 利用消息实现应用程序间的交互机制，能够在程序运行的过程中连接两个不同的组件

### 1.4 Android 开发环境搭建

- 当前，Android 开发环境有：
  - Eclipse
  - ADT-Bundle (Eclipse + ADT + SDK)
  - Android Studio 

### 1.5 Android 项目架构

### 1.6 Android 示例













