namespace SatelliteLocDemo
{
    using System;
    using System.Diagnostics;
    using System.Globalization;
    using System.IO;
    using System.Reflection;
    using System.Threading;
    using System.Windows;

    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public App()
        {
            AppDomain.CurrentDomain.AssemblyResolve += this.CurrentDomain_AssemblyResolve;
        }

        public static string GetBasePath()
        {
            using ProcessModule processModule = Process.GetCurrentProcess().MainModule;
            return Path.GetDirectoryName(processModule?.FileName)!;
        }

        private Assembly CurrentDomain_AssemblyResolve(object sender, ResolveEventArgs args)
        {
            try
            {
                if (args.Name != null && args.Name.StartsWith("SatelliteLocDemo.resources"))
                {
                    string assemblyPath = $"{GetBasePath()}\\Languages\\{Thread.CurrentThread.CurrentUICulture.Name}\\SatelliteLocDemo.resources.dll";
                    Assembly assembly = Assembly.LoadFrom(assemblyPath);
                    return assembly;
                }

                return null;
            }
            catch (Exception e)
            {
                Trace.WriteLine($"Error loading translations for {args.Name}");
                Trace.WriteLine(e);
                return null;
            }
        }
    }
}
