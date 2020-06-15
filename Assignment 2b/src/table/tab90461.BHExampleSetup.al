table 90461 "BH Example Setup"
{
    fields
    {
        field(1; "Primary Key"; Code[10]) { }
        field(2; "Example Nos."; Code[20]) { TableRelation = "No. Series"; }
        field(3; "Document Nos."; Code[20]) { TableRelation = "No. Series"; }

    }
    keys
    {
        key(PK; "Primary Key") { Clustered = true; }
    }
    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;
}