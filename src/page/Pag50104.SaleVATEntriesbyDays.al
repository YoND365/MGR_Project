page 50104 "Sale VAT Entries by Days"
{
    ApplicationArea = All;
    Caption = 'Import Sale VAT Entries by Days';
    PageType = List;
    SourceTable = "Sale VAT Entries by Days";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Number; Rec.Number)
                {
                    ToolTip = 'Specifies the value of the Number field.';
                    Caption = 'ลำดับ';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    Caption = 'วันที่';
                }
                field("Tax Invoice No."; Rec."Tax Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Tax Invoice No. field.';
                    Caption = 'ใบกำกับภาษีอย่างย่อ';
                }
                field("Cash Register Code"; Rec."Cash Register Code")
                {
                    ToolTip = 'Specifies the value of the Cash Register Code field.';
                    Caption = 'รหัสเครื่องบันทึกการเก็บเงิน';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    Caption = 'รายการ';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                    Caption = 'มูลค่าสินค้า/บริการ';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                    Caption = 'จำนวนเงินภาษีมูลค่าเพิ่ม';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                    Caption = 'จำนวนเงิน';
                }
                field(Remark; Rec.Remark)
                {
                    ToolTip = 'Specifies the value of the Remark field.';
                    Caption = 'หมายเหตุ';
                }
                field("Canceled Receipt No."; Rec."Canceled Receipt No.")
                {
                    ToolTip = 'Specifies the value of the Canceled Receipt No. field.';
                    Caption = 'เลขที่ใบเสร็จที่ยกเลิก';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';

                trigger OnAction()
                var
                begin
                    ImportExcel.ReadExcelSheet();
                    ImportExcel.ImportSaleVATEntriesbyDays();
                end;
            }
        }
    }
    var
        ImportExcel: Codeunit "Import Excel";
}
