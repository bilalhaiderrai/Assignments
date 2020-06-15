table 90463 "BH Example Types"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;
    DrillDownPageId = "BH Example Types";
    LookupPageId = "BH Example Types";
    fields
    {
        field(1; Code; Code[20]) { DataClassification = ToBeClassified; }
        field(2; Description; Text[50]) { }
    }

    keys
    {
        key(PK; Code) { Clustered = true; }
    }

}