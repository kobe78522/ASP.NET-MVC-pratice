//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace prjShoppingCar3.Models
{
    using System;
    using System.Collections.Generic;

    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public partial class tAdmin
    {
        public int fId { get; set; }

        [DisplayName("帳號")]
        [Required]
        public string fUserId { get; set; }

        [DisplayName("密碼")]
        [Required]
        public string fPwd { get; set; }
    }
}

