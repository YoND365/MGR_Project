table 50100 "Summary Sales by Invoice"
{
    Caption = 'Summary Sales by Invoice';
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
        field(3; "Sale Invoice No."; Code[20])
        {
            Caption = 'Sale Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Sale Mode"; Code[30])
        {
            Caption = 'Sale Mode';
            DataClassification = ToBeClassified;
        }
        field(5; "Table - Queue"; Code[30])
        {
            Caption = 'Table - Queue';
            DataClassification = ToBeClassified;
        }
        field(6; Customer; Integer)
        {
            Caption = 'Customer';
            DataClassification = ToBeClassified;
        }
        field(7; "Selling Price"; Decimal)
        {
            Caption = 'Selling Price';
            DataClassification = ToBeClassified;
        }
        field(8; Discount; Decimal)
        {
            Caption = 'Discount';
            DataClassification = ToBeClassified;
        }
        field(9; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            DataClassification = ToBeClassified;
        }
        field(10; SC; Decimal)
        {
            Caption = 'SC';
            DataClassification = ToBeClassified;
        }
        field(11; "Grand Total"; Decimal)
        {
            Caption = 'Grand Total';
            DataClassification = ToBeClassified;
        }
        field(12; "Amount Before VAT"; Decimal)
        {
            Caption = 'Amount Before VAT';
            DataClassification = ToBeClassified;
        }
        field(13; "Sale VAT Amount"; Decimal)
        {
            Caption = 'Sale VAT Amount';
            DataClassification = ToBeClassified;
        }
        field(14; Cash; Decimal)
        {
            Caption = 'Cash';
            DataClassification = ToBeClassified;
        }
        field(15; "Credit Card"; Decimal)
        {
            Caption = 'Credit Card';
            DataClassification = ToBeClassified;
        }
        field(16; "Delivery"; Decimal)
        {
            Caption = 'Delivery ';
            DataClassification = ToBeClassified;
        }
        field(17; "Grab Credit"; Decimal)
        {
            Caption = 'Grab Credit';
            DataClassification = ToBeClassified;
        }
        field(18; "Line Man (Credit)"; Decimal)
        {
            Caption = 'Line Man (Credit)';
            DataClassification = ToBeClassified;
        }
        field(19; "HD (Cash)"; Decimal)
        {
            Caption = 'HD (Cash)';
            DataClassification = ToBeClassified;
        }
        field(20; "HD (Credit)"; Decimal)
        {
            Caption = 'HD (Credit)';
            DataClassification = ToBeClassified;
        }
        field(21; Robinhood; Decimal)
        {
            Caption = 'Robinhood';
            DataClassification = ToBeClassified;
        }
        field(22; "SCB QR"; Decimal)
        {
            Caption = 'SCB QR';
            DataClassification = ToBeClassified;
        }
        field(23; "SPF Credit"; Decimal)
        {
            Caption = 'SPF Credit';
            DataClassification = ToBeClassified;
        }
        field(24; "Payment Amount"; Decimal)
        {
            Caption = 'Payment Amount';
            DataClassification = ToBeClassified;
        }
        field(25; "Difference Amount"; Decimal)
        {
            Caption = 'Difference Amount';
            DataClassification = ToBeClassified;
        }
        field(26; "Average Per Bill"; Decimal)
        {
            Caption = 'Average Per Bill';
            DataClassification = ToBeClassified;
        }
        field(27; "Average Per Capita"; Decimal)
        {
            Caption = 'Average Per Capita';
            DataClassification = ToBeClassified;
        }
        field(28; "File Name"; Text[50])
        {
            Caption = 'File Name';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(29; "Sheet Name"; Text[30])
        {
            Caption = 'Sheet Name';
            DataClassification = ToBeClassified;
        }
        field(30; "Imported Date"; Date)
        {
            Caption = 'Imported Date';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(31; "Imported Time"; Time)
        {
            Caption = 'Imported Time';
            Editable = false;
            DataClassification = ToBeClassified;
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
