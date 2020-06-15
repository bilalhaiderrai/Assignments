table 90420 "BH Customer Overview"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No';
        }
        field(2; "Customer No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No';
        }
        field(3; "Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Name';
        }
        field(4; "Source Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Source Code';
        }
        field(5; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount';
        }
        field(6; LastRunDate; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Run Date';
        }
    }

    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }
}