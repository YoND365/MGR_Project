table 50101 "Summary Sale by Day"
{
    Caption = 'Summary Sale by Day';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(3; "Bill No."; Code[20])
        {
            Caption = 'Bill No.';
            DataClassification = ToBeClassified;
        }
        field(4; Customer; Integer)
        {
            Caption = 'Customer';
            DataClassification = ToBeClassified;
        }
        field(5; "Selling Price"; Decimal)
        {
            Caption = 'Selling Price';
            DataClassification = ToBeClassified;
        }
        field(6; Discount; Decimal)
        {
            Caption = 'Discount';
            DataClassification = ToBeClassified;
        }
        field(7; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            DataClassification = ToBeClassified;
        }
        field(8; SC; Decimal)
        {
            Caption = 'SC';
            DataClassification = ToBeClassified;
        }
        field(9; "Grand Total"; Decimal)
        {
            Caption = 'Grand Total';
            DataClassification = ToBeClassified;
        }
        field(10; "Amount Before VAT"; Decimal)
        {
            Caption = 'Amount Before VAT';
            DataClassification = ToBeClassified;
        }
        field(11; "Sale VAT Amount"; Decimal)
        {
            Caption = 'Sale VAT Amount';
            DataClassification = ToBeClassified;
        }
        field(12; Cash; Decimal)
        {
            Caption = 'Cash';
            DataClassification = ToBeClassified;
        }
        field(13; "Credit Card"; Decimal)
        {
            Caption = 'Credit Card';
            DataClassification = ToBeClassified;
        }
        field(14; KTC100; Decimal)
        {
            Caption = 'KTC100';
            DataClassification = ToBeClassified;
        }
        field(15; KTC500; Decimal)
        {
            Caption = 'KTC500';
            DataClassification = ToBeClassified;
        }
        field(16; "Food Panda"; Decimal)
        {
            Caption = 'Food Panda';
            DataClassification = ToBeClassified;
        }
        field(17; Delivery; Decimal)
        {
            Caption = 'Delivery';
            DataClassification = ToBeClassified;
        }
        field(18; PGS1000; Decimal)
        {
            Caption = 'PGS1000';
            DataClassification = ToBeClassified;
        }
        field(19; "Grab Credit"; Decimal)
        {
            Caption = 'Grab Credit';
            DataClassification = ToBeClassified;
        }
        field(20; "Line Man (Credit)"; Decimal)
        {
            Caption = 'Line Man (Credit)';
            DataClassification = ToBeClassified;
        }
        field(21; "HD (Cash)"; Decimal)
        {
            Caption = 'HD (Cash)';
            DataClassification = ToBeClassified;
        }
        field(22; "HD (Credit)"; Decimal)
        {
            Caption = 'HD (Credit)';
            DataClassification = ToBeClassified;
        }
        field(23; "HD PAY IN"; Decimal)
        {
            Caption = 'HD PAY IN';
            DataClassification = ToBeClassified;
        }
        field(24; Lazada; Decimal)
        {
            Caption = 'Lazada';
            DataClassification = ToBeClassified;
        }
        field(25; robinhood; Decimal)
        {
            Caption = 'robinhood';
            DataClassification = ToBeClassified;
        }
        field(26; "SCB QR"; Decimal)
        {
            Caption = 'SCB QR';
            DataClassification = ToBeClassified;
        }
        field(27; Claim; Decimal)
        {
            Caption = 'Claim';
            DataClassification = ToBeClassified;
        }
        field(28; "SPF Credit"; Decimal)
        {
            Caption = 'SPF Credit';
            DataClassification = ToBeClassified;
        }
        field(29; "Hungry Hub"; Decimal)
        {
            Caption = 'Hungry Hub';
            DataClassification = ToBeClassified;
        }
        field(30; "E-Voucher 600"; Decimal)
        {
            Caption = 'E-Voucher 600';
            DataClassification = ToBeClassified;
        }
        field(31; "PGS(CRM) 1000"; Decimal)
        {
            Caption = 'PGS(CRM) 1000';
            DataClassification = ToBeClassified;
        }
        field(32; "PGS(CRM) 500"; Decimal)
        {
            Caption = 'PGS(CRM) 500';
            DataClassification = ToBeClassified;
        }
        field(33; "E-Voucher AIA 150"; Decimal)
        {
            Caption = 'E-Voucher AIA 150';
            DataClassification = ToBeClassified;
        }
        field(34; "Payment Amount"; Decimal)
        {
            Caption = 'Payment Amount';
            DataClassification = ToBeClassified;
        }
        field(35; "Difference Amount"; Decimal)
        {
            Caption = 'Difference Amount';
            DataClassification = ToBeClassified;
        }
        field(36; "Average Per Bill"; Decimal)
        {
            Caption = 'Average Per Bill';
            DataClassification = ToBeClassified;
        }
        field(37; "Average Per Capita"; Decimal)
        {
            Caption = 'Average Per Capita';
            DataClassification = ToBeClassified;
        }
        field(38; "File Name"; Text[50])
        {
            Caption = 'File Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39; "Sheet Name"; Text[30])
        {
            Caption = 'Sheet Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(40; "Imported Date"; Date)
        {
            Caption = 'Imported Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(41; "Imported Time"; Time)
        {
            Caption = 'Imported Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
