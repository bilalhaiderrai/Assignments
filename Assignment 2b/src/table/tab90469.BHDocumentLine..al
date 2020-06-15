table 90469 "BH Document Line"
{
    fields
    {
        field(1; "Document No."; Code[20])
        {
            TableRelation = "BH Document Header";
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Example No."; Code[20])
        {
            TableRelation = "BH Example Master Data";
        }
        field(4; "Egg Date"; Date)
        {
        }
        field(6; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(7; "Example Description"; Text[50])
        {
            CalcFormula = Lookup ("BH Example Master Data".Description WHERE("No." = FIELD("Example No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    }
}
