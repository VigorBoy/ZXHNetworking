# ZXHNetworking
基于AFNetworking3.0以上版本封装的网络层。提供常用的GET/POST接口、上传下载图片、文件接口、支持缓存等。
#version1.1

* 升级AFNetworking到2.5.4
* 新增带上传进度的API和带进度的下载API，详细请阅读下面的博文
* 支持pod:    pod 'ZXHNetworking', '~> 1.1'

#version 1.1.1

* 修改原来默认URLEncode由YES改为NO。

#version 1.1.2

* 追加text/plain格式

#version 1.1.3

* 追加两个兼容性API，图片上传时可额外上传参数

#version 2.0.0

* 升级AFNetworking到3.0，基于AFNetworking3.0.4而写的版本
* 支持iOS7.0及其以上版本

#version 3.0.0

* 简化API，以降低使用的要求
* 增加GET/POST数据缓存、获取缓存大小、清空缓存功能
* 接口增加刷新缓存功能
* 增加取消所有请求、取消单个请求功能
* 格式化打印日志
* 增加对手动取消请求接口是否在失败时还回调的控制


#version 3.2.0

* 增加请求超时设置
* 增加配置是否在网络异常（无网络）时自动尝试从本地读取缓存。

#version 3.2.1

* 完善无网状态下缓存的处理