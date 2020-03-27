# weather
一款简单的天气查询app
## 主要实现方法
* 该项目实现获取用户所在地的方法是调用系统提供的方法和delegate，同时在反向传值时编写了一个自定义的delegate
* 在调用api接口时，接收数据涉及到json数据的转换，所有引入了swiftjson第三方包进行编码的转换
* 在项目发送接受网络请求时引入了第三方包Alamofire
# app截图
## 所在地天气
![text1](https://github.com/SupColMan/-/blob/master/%E6%88%AA%E5%B1%8F2020-03-26%E4%B8%8B%E5%8D%886.40.43.png)

## 查询天气界面
![text2](https://github.com/SupColMan/-/blob/master/%E6%88%AA%E5%B1%8F2020-03-26%E4%B8%8B%E5%8D%886.40.29.png)

### 注意事项
* 该项目调用了OpenWeather网站的api接口，使用该网站的api接口时需要提供一个用户id需要在网站上注册
* 该项目查询天气时目前暂支持英文目的地查询

