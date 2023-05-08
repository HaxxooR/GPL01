using System.ComponentModel.DataAnnotations;

namespace LAB_0805.Users.Dto
{
    public class ChangeUserLanguageDto
    {
        [Required]
        public string LanguageName { get; set; }
    }
}