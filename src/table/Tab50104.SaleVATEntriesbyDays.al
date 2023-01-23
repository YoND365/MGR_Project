table 50104 "Sale VAT Entries by Days"
{
    Caption = 'Sale VAT Entries by Days';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; Number; Integer)
        {
            Caption = 'Number';
            DataClassification = ToBeClassified;
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Tax Invoice No."; Text[100])
        {
            Caption = 'Tax Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(5; "Cash Register Code"; Text[100])
        {
            Caption = 'Cash Register Code';
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(8; "VAT Amount"; Decimal)
        {
            Caption = 'VAT Amount';
            DataClassification = ToBeClassified;
        }
        field(9; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            DataClassification = ToBeClassified;
        }
        field(10; Remark; Text[150])
        {
            Caption = 'Remark';
            DataClassification = ToBeClassified;
        }
        field(11; "Canceled Receipt No."; Text[100])
        {
            Caption = 'Canceled Receipt No.';
            DataClassification = ToBeClassified;
        }
        field(12; "File Name"; Text[50])
        {
            Caption = 'File Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Sheet Name"; Text[30])
        {
            Caption = 'Sheet Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Imported Date"; Date)
        {
            Caption = 'Imported Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Imported time"; Time)
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
