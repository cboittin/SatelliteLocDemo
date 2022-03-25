namespace SatelliteLocDemo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.Globalization;
    using System.Linq;
    using System.Text;
    using System.Threading;
    using System.Threading.Tasks;
    using System.Windows;
    using System.Windows.Controls;
    using System.Windows.Data;
    using System.Windows.Documents;
    using System.Windows.Input;
    using System.Windows.Media;
    using System.Windows.Media.Imaging;
    using System.Windows.Navigation;
    using System.Windows.Shapes;

    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        public MainWindow()
        {
            this.InitializeComponent();
            SetLanguage("en-US");
            this.SetUIText();
            this.DataContext = this;
        }

        public string ErrorText { get; set; }

        public string Text1 { get; set; }

        public string Text2 { get; set; }

        public event PropertyChangedEventHandler PropertyChanged;

        private void SetUIText()
        {
            this.ErrorText = Properties.Errors.ErrorString;
            this.Text1 = Properties.Resources.Label1;
            this.Text2 = Properties.Resources.Label2;
            this.PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("ErrorText"));
            this.PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("Text1"));
            this.PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("Text2"));
        }

        public static void SetLanguage(string languageCode)
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(languageCode);

            Properties.Resources.Culture = Thread.CurrentThread.CurrentUICulture;
            Properties.Errors.Culture = Thread.CurrentThread.CurrentUICulture;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.ErrorTextBlock.Visibility = Visibility.Visible;
            Task.Run(async () =>
            {
                await Task.Delay(10000);
                Application.Current.Dispatcher.Invoke(() =>
                {
                    this.ErrorTextBlock.Visibility = Visibility.Hidden;
                });
            });
        }

        private void LanguageButton_Click(object sender, RoutedEventArgs e)
        {
            switch (Thread.CurrentThread.CurrentUICulture.Name)
            {
                case "en-US":
                    SetLanguage("fr-FR");
                    break;
                case "fr-FR":
                    SetLanguage("de-DE");
                    break;
                case "de-DE":
                    SetLanguage("en-US");
                    break;
            }

            this.SetUIText();
        }
    }
}
