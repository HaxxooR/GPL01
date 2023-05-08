using LAB_0805.Debugging;

namespace LAB_0805
{
    public class LAB_0805Consts
    {
        public const string LocalizationSourceName = "LAB_0805";

        public const string ConnectionStringName = "Default";

        public const bool MultiTenancyEnabled = true;


        /// <summary>
        /// Default pass phrase for SimpleStringCipher decrypt/encrypt operations
        /// </summary>
        public static readonly string DefaultPassPhrase =
            DebugHelper.IsDebug ? "gsKxGZ012HLL3MI5" : "02f01215a7ad4f65b0adbe5720019293";
    }
}
