table 50102 "Sale Sumary by invoice"
{
    Caption = 'Sale Sumary by invoice';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Bill No."; Code[20])
        {
            Caption = 'Bill No.';
            DataClassification = ToBeClassified;
        }
        field(3; "No. of Bill"; Integer)
        {
            Caption = 'No. of Bill';
            DataClassification = ToBeClassified;
        }
        field(4; Customer; Integer)
        {
            Caption = 'Customer';
            DataClassification = ToBeClassified;
        }
        field(5; Food; Decimal)
        {
            Caption = 'Food';
            DataClassification = ToBeClassified;
        }
        field(6; Desert; Decimal)
        {
            Caption = 'Desert';
            DataClassification = ToBeClassified;
        }
        field(7; Beverage; Decimal)
        {
            Caption = 'Beverage';
            DataClassification = ToBeClassified;
        }
        field(8; Other; Decimal)
        {
            Caption = 'Other';
            DataClassification = ToBeClassified;
        }
        field(9; Promotion; Decimal)
        {
            Caption = 'Promotion';
            DataClassification = ToBeClassified;
        }
        field(10; "Food Box"; Decimal)
        {
            Caption = 'Food Box';
            DataClassification = ToBeClassified;
        }
        field(11; SumAmount; Decimal)
        {
            Caption = 'SumAmount';
            DataClassification = ToBeClassified;
        }
        field(12; Discount; Decimal)
        {
            Caption = 'Discount';
            DataClassification = ToBeClassified;
        }
        field(13; "total Amount"; Decimal)
        {
            Caption = 'total Amount';
            DataClassification = ToBeClassified;
        }
        field(14; SC; Decimal)
        {
            Caption = 'SC';
            DataClassification = ToBeClassified;
        }
        field(15; "Grand Total"; Decimal)
        {
            Caption = 'Grand Total';
            DataClassification = ToBeClassified;
        }
        field(16; "Amount Inc. VAT"; Decimal)
        {
            Caption = 'Amount Inc. VAT';
            DataClassification = ToBeClassified;
        }
        field(17; "VAT Amount"; Decimal)
        {
            Caption = 'VAT Amount';
            DataClassification = ToBeClassified;
        }
        field(18; "Average Per Capita"; Decimal)
        {
            Caption = 'Average Per Capita';
            DataClassification = ToBeClassified;
        }
        field(19; "Average Per Bill"; Decimal)
        {
            Caption = 'Average Per Bill';
            DataClassification = ToBeClassified;
        }
        field(20; Cash; Decimal)
        {
            Caption = 'Cash';
            DataClassification = ToBeClassified;
        }
        field(21; "Credit Card"; Decimal)
        {
            Caption = 'Credit Card';
            DataClassification = ToBeClassified;
        }
        field(22; Visa; Decimal)
        {
            Caption = 'Visa';
            DataClassification = ToBeClassified;
        }
        field(23; Master; Decimal)
        {
            Caption = 'Master';
            DataClassification = ToBeClassified;
        }
        field(24; Delivery; Decimal)
        {
            Caption = 'Delivery';
            DataClassification = ToBeClassified;
        }
        field(25; "Grab Credit"; Decimal)
        {
            Caption = 'Grab Credit';
            DataClassification = ToBeClassified;
        }
        field(26; "Line Man (Credit)"; Decimal)
        {
            Caption = 'Line Man (Credit)';
            DataClassification = ToBeClassified;
        }
        field(27; "HD (Cash)"; Decimal)
        {
            Caption = 'HD (Cash)';
            DataClassification = ToBeClassified;
        }
        field(28; "HD (Credit)"; Decimal)
        {
            Caption = 'HD (Credit)';
            DataClassification = ToBeClassified;
        }
        field(29; Robinhood; Decimal)
        {
            Caption = 'Robinhood';
            DataClassification = ToBeClassified;
        }
        field(30; "SCB QR"; Decimal)
        {
            Caption = 'SCB QR';
            DataClassification = ToBeClassified;
        }
        field(31; "SPF Credit"; Decimal)
        {
            Caption = 'SPF Credit';
            DataClassification = ToBeClassified;
        }
        field(32; "Payment Amount"; Decimal)
        {
            Caption = 'Payment Amount';
            DataClassification = ToBeClassified;
        }
        field(33; "Difference Amount"; Decimal)
        {
            Caption = 'Difference Amount';
            DataClassification = ToBeClassified;
        }
        field(34; "File Name"; Text[50])
        {
            Caption = 'File Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(35; "Sheet Name"; Text[30])
        {
            Caption = 'Sheet Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(36; "Imported Date"; Date)
        {
            Caption = 'Imported Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(37; "Imported time"; Time)
        {
            Caption = 'Imported time';
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
