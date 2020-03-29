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

#### 安装 SDK tools 及 SDK

1. 配置 Android 环境变量

   用户变量 PATH `J:\android-sdk-windows\tools`

2. 离线安装 ADT 插件
   1. 下载 ADT 插件 `ADT-23.0.6.zip`

   2. 启动 Eclipse，`Help`→`Install New Software`

      ![Android-1.4-Help-InstallNewSoftware](N:\Desktop\review\Android\images\Android-1.4-Help-InstallNewSoftware.png)

   3. `Add`

      ![](N:\Desktop\review\Android\images\Android-1.4-Help-InstallNewSoftware-Install.png)

   4. Location：ADT 的路径

   ![](N:\Desktop\review\Android\images\Android-1.4-Help-InstallNewSoftware-Install-AddRepository.png)

   5. 接下来全是 Next 或者 Finish，Eclipse 界面下面的进度条 100% 后，重启 Eclipse，安装完成

## 二、活动 Activity

### 2.1 Activity 入门

#### 2.1.1 简介

| Activity                                   | 事件     |
| ------------------------------------------ | -------- |
| **onKeyDown**(int keyCode,KeyEvent event); | 按键按下 |
| **onKeyUp**(int keyCode,KeyEvent event);   | 按键松开 |
| **onTouchEvent**(MotionEvent event);       | 点击屏幕 |

#### 2.1.2 创建

#### 2.1.3 生命周期

#### 2.1.4 存活案例

#### 2.1.5 任务栈

### 2.2 Activity 中的资源使用

### 2.3 LogCat 的使用

### 2.4 主题讨论

## 三、用户界面



