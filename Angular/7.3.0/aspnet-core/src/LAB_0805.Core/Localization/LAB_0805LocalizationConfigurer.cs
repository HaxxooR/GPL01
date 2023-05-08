using Abp.Configuration.Startup;
using Abp.Localization.Dictionaries;
using Abp.Localization.Dictionaries.Xml;
using Abp.Reflection.Extensions;

namespace LAB_0805.Localization
{
    public static class LAB_0805LocalizationConfigurer
    {
        public static void Configure(ILocalizationConfiguration localizationConfiguration)
        {
            localizationConfiguration.Sources.Add(
                new DictionaryBasedLocalizationSource(LAB_0805Consts.LocalizationSourceName,
                    new XmlEmbeddedFileLocalizationDictionaryProvider(
                        typeof(LAB_0805LocalizationConfigurer).GetAssembly(),
                        "LAB_0805.Localization.SourceFiles"
                    )
                )
            );
        }
    }
}
