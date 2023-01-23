table 50103 "Sale VAT Entries by Invoice"
{
    Caption = 'Sale VAT Entries by Invoice';
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
        field(4; "Tax Invoice No."; Code[20])
        {
            Caption = 'Tax Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(5; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
        }
        field(6; "VAT Register No."; Text[30])
        {
            Caption = 'VAT Register No.';
            DataClassification = ToBeClassified;
        }
        field(7; "Head Office"; Text[100])
        {
            Caption = 'Head Office';
            DataClassification = ToBeClassified;
        }
        field(8; Branch; Text[100])
        {
            Caption = 'Branch';
            DataClassification = ToBeClassified;
        }
        field(9; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(10; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(11; "VAT Amount"; Decimal)
        {
            Caption = 'VAT Amount';
            DataClassification = ToBeClassified;
        }
        field(12; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            DataClassification = ToBeClassified;
        }
        field(13; Remark; Text[150])
        {
            Caption = 'Remark';
            DataClassification = ToBeClassified;
        }
        field(14; "File Name"; Text[50])
        {
            Caption = 'File Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Sheet Name"; Text[30])
        {
            Caption = 'Sheet Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Imported Date"; Date)
        {
            Caption = 'Imported Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Imported time"; Time)
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
