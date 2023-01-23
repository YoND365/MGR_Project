page 50102 "Sale Summary by invoice"
{
    ApplicationArea = All;
    Caption = 'Import Sale Summary by invoice';
    PageType = List;
    SourceTable = "Sale Sumary by invoice";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Bill No."; Rec."Bill No.")
                {
                    ToolTip = 'Specifies the value of the Bill No. field.';
                    Caption = 'เลขที่บิล';
                }
                field("No. of Bill"; Rec."No. of Bill")
                {
                    ToolTip = 'Specifies the value of the No. of Bill field.';
                    Caption = 'จำนวนบิล';
                }
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Specifies the value of the Customer field.';
                    Caption = 'ลูกค้า';
                }
                field(Food; Rec.Food)
                {
                    ToolTip = 'Specifies the value of the Food field.';
                }
                field(Desert; Rec.Desert)
                {
                    ToolTip = 'Specifies the value of the Desert field.';
                }
                field(Beverage; Rec.Beverage)
                {
                    ToolTip = 'Specifies the value of the Beverage field.';
                }
                field(Other; Rec.Other)
                {
                    ToolTip = 'Specifies the value of the Other field.';
                }
                field(Promotion; Rec.Promotion)
                {
                    ToolTip = 'Specifies the value of the Promotion field.';
                }
                field("Food Box"; Rec."Food Box")
                {
                    ToolTip = 'Specifies the value of the Food Box field.';
                }
                field(SumAmount; Rec.SumAmount)
                {
                    ToolTip = 'Specifies the value of the SumAmount field.';
                    Caption = 'รวม';
                }
                field(Discount; Rec.Discount)
                {
                    ToolTip = 'Specifies the value of the Discount field.';
                    Caption = 'ส่วนลด';
                }
                field("total Amount"; Rec."total Amount")
                {
                    ToolTip = 'Specifies the value of the total Amount field.';
                    caption = 'ยอดรวม';
                }
                field(SC; Rec.SC)
                {
                    ToolTip = 'Specifies the value of the SC field.';
                }
                field("Grand Total"; Rec."Grand Total")
                {
                    ToolTip = 'Specifies the value of the Grand Total field.';
                    Caption = 'ยอดสุทธิ';
                }
                field("Amount Inc. VAT"; Rec."Amount Inc. VAT")
                {
                    ToolTip = 'Specifies the value of the Amount Inc. VAT field.';
                    Caption = 'ยอดที่คิดภาษี';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                    Caption = 'ภาษี';
                }
                field("Average Per Capita"; Rec."Average Per Capita")
                {
                    ToolTip = 'Specifies the value of the Average Per Capita field.';
                    Caption = 'เฉลี่ยต่อหัว';
                }
                field("Average Per Bill"; Rec."Average Per Bill")
                {
                    ToolTip = 'Specifies the value of the Average Per Bill field.';
                    Caption = 'เฉลี่ยต่อบิล';
                }
                field(Cash; Rec.Cash)
                {
                    ToolTip = 'Specifies the value of the Cash field.';
                }
                field("Credit Card"; Rec."Credit Card")
                {
                    ToolTip = 'Specifies the value of the Credit Card field.';
                }
                field(Visa; Rec.Visa)
                {
                    ToolTip = 'Specifies the value of the Visa field.';
                }
                field(Master; Rec.Master)
                {
                    ToolTip = 'Specifies the value of the Master field.';
                }
                field(Delivery; Rec.Delivery)
                {
                    ToolTip = 'Specifies the value of the Delivery field.';
                }
                field("Grab Credit"; Rec."Grab Credit")
                {
                    ToolTip = 'Specifies the value of the Grab Credit field.';
                }
                field("Line Man (Credit)"; Rec."Line Man (Credit)")
                {
                    ToolTip = 'Specifies the value of the Line Man (Credit) field.';
                }
                field("HD (Cash)"; Rec."HD (Cash)")
                {
                    ToolTip = 'Specifies the value of the HD (Cash) field.';
                }
                field("HD (Credit)"; Rec."HD (Credit)")
                {
                    ToolTip = 'Specifies the value of the HD (Credit) field.';
                }
                field(Robinhood; Rec.Robinhood)
                {
                    ToolTip = 'Specifies the value of the Robinhood field.';
                }
                field("SCB QR"; Rec."SCB QR")
                {
                    ToolTip = 'Specifies the value of the SCB QR field.';
                }
                field("SPF Credit"; Rec."SPF Credit")
                {
                    ToolTip = 'Specifies the value of the SPF Credit field.';
                }
                field("Payment Amount"; Rec."Payment Amount")
                {
                    ToolTip = 'Specifies the value of the Payment Amount field.';
                    Caption = 'ยอดชำระ';
                }
                field("Difference Amount"; Rec."Difference Amount")
                {
                    ToolTip = 'Specifies the value of the Difference Amount field.';
                    Caption = 'ส่วนต่าง';
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
                    ImportExcel.ImportSaleSumarybyinvoice();
                end;
            }
        }
    }
    var
        ImportExcel: Codeunit "Import Excel";
}
