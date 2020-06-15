table 90402 "BH Course"
{
    fields
    {
        field(10; Code; Code[10]) { }
        field(20; Name; Text[30]) { }
        field(30; Description; Text[50]) { }
        field(40; Type; Enum "BH Course Type") { }
        field(50; Duration; Decimal) { }
        field(60; Price; Decimal) { }
        field(70; Active; Boolean) { }
        field(80; Difficulty; Integer) { }
        field(90; PassingRate; Integer) { }
        field(100; "Instructor Code"; Code[20]) { TableRelation = Resource."No." where(Type = const(Person)); }
        field(120; "Instructor Name"; Text[50])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup (Resource.Name where("No." = field("Instructor Code")));
        }
    }
    keys
    {
        key(PK; Code) { Clustered = true; }
        key("Secondary Key 1"; "Instructor Code") { }
        key("Secondary Key 2"; Type) { }
    }
}