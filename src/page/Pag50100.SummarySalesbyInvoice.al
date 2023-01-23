page 50100 "Summary Sales by Invoice"
{
    ApplicationArea = All;
    Caption = 'Import Summary Sales by Invoice';
    PageType = List;
    SourceTable = "Summary Sales by Invoice";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Sale Invoice No."; Rec."Sale Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Sale Invoice No. field.';
                    Caption = 'เลขที่บิล';
                }
                field("Sale Mode"; Rec."Sale Mode")
                {
                    ToolTip = 'Specifies the value of the Sale Mode field.';
                }
                field("Table - Queue"; Rec."Table - Queue")
                {
                    ToolTip = 'Specifies the value of the Table - Queue field.';
                    Caption = 'โต๊ะ/คิว';
                }
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Specifies the value of the Customer field.';
                    Caption = '# ลูกค้า';
                }
                field("Selling Price"; Rec."Selling Price")
                {
                    ToolTip = 'Specifies the value of the Selling Price field.';
                    Caption = 'ราคาขาย';
                }
                field(Discount; Rec.Discount)
                {
                    ToolTip = 'Specifies the value of the Discount field.';
                    Caption = 'ส่วนลด';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                    Caption = 'รวมราคา';
                }
                field(SC; Rec.SC)
                {
                    ToolTip = 'Specifies the value of the SC field.';
                }
                field("Grand Total"; Rec."Grand Total")
                {
                    ToolTip = 'Specifies the value of the Grand Total field.';
                    Caption = 'ราคาสุทธิ';
                }
                field("Amount Before VAT"; Rec."Amount Before VAT")
                {
                    ToolTip = 'Specifies the value of the Amount Before VAT field.';
                    Caption = 'ยอดก่อนภาษี';
                }
                field("Sale VAT Amount"; Rec."Sale VAT Amount")
                {
                    ToolTip = 'Specifies the value of the Sale VAT Amount field.';
                    Caption = 'ภาษีขาย';
                }
                field(Cash; Rec.Cash)
                {
                    ToolTip = 'Specifies the value of the Cash field.';
                }
                field("Credit Card"; Rec."Credit Card")
                {
                    ToolTip = 'Specifies the value of the Credit Card field.';
                }
                field("Delivery"; Rec."Delivery")
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
                field("Average Per Bill"; Rec."Average Per Bill")
                {
                    ToolTip = 'Specifies the value of the Average Per Bill field.';
                    Caption = 'เฉลี่ยต่อบิล';
                }
                field("Average Per Capita"; Rec."Average Per Capita")
                {
                    ToolTip = 'Specifies the value of the Average Per Capita field.';
                    Caption = 'เฉลี่ยต่อหัว';
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
                    ImportExcel.ImportSummarySalesbyInvoice();
                end;
            }
        }
    }
    var
        ImportExcel: Codeunit "Import Excel";
}
