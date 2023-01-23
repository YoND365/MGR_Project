page 50103 "Sale VAT Entries by Invoice"
{
    ApplicationArea = All;
    Caption = 'Import Sale VAT Entries by Invoice';
    PageType = List;
    SourceTable = "Sale VAT Entries by Invoice";
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
                    Caption = 'ใบกำกับภาษีเลขที่';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    Caption = 'ชื่อลูกค้า';
                }
                field("VAT Register No."; Rec."VAT Register No.")
                {
                    ToolTip = 'Specifies the value of the VAT Register No. field.';
                    Caption = 'เลขประจำตัวผู้เสียภาษีอากร';
                }
                field("Head Office"; Rec."Head Office")
                {
                    ToolTip = 'Specifies the value of the Head Office field.';
                    Caption = 'สำนักงานใหญ่';
                }
                field(Branch; Rec.Branch)
                {
                    ToolTip = 'Specifies the value of the Branch field.';
                    Caption = 'สาขาที่';
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
                    Caption = 'ภาษีมูลค่าเพิ่ม';
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
                    ImportExcel.ImportSaleVATEntriesbyInvoice();
                end;
            }
        }
    }
    var
        ImportExcel: Codeunit "Import Excel";
}
