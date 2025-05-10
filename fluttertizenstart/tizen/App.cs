using Tizen.Flutter.Embedding;
using Tizen.Applications; // 如果需要使用Tizen应用程序相关的API
using Tizen.System; // 如果需要使用Tizen系统相关的API

namespace Runner
{
    public class App : FlutterApplication
    {
        protected override void OnCreate()
        {
            base.OnCreate();

            GeneratedPluginRegistrant.RegisterPlugins(this);
        }

        static void Main(string[] args)
        {
            var app = new App();
            app.Run(args);
        }
    }
}
