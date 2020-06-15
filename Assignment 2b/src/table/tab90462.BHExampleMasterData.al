table 90462 "BH Example Master Data"
{
    DrillDownPageID = "BH Example List";
    LookupPageID = "BH Example List";
    fields
    {
        field(1; "No."; Code[20])
        {
            trigger OnValidate();
            begin
                IF "No." <> xRec."No." THEN begin
                    ExampleSetup.GET;
                    NoSeriesManagement.TestManual(ExampleSetup."Example Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[50]) { }
        field(3; "Example Type Code"; Code[20]) { TableRelation = "BH Example Types"; }
        field(4; "No. Series"; Code[20]) { }

    }
    keys
    {
        key(Key1; "No.") { Clustered = true; }
    }
    trigger OnInsert();
    begin
        IF "No." = '' THEN begin
            ExampleSetup.GET;
            ExampleSetup.TESTFIELD("Example Nos.");
            NoSeriesManagement.InitSeries(ExampleSetup."Example Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ExampleSetup: Record "BH Example Setup";

    Procedure AssistEdit(OldExample: Record "BH Example Master Data"): Boolean;
    var
        Example: Record "BH Example Master Data";
    begin
        WITH Example DO begin
            Example := Rec;
            ExampleSetup.GET;
            ExampleSetup.TESTFIELD("Example Nos.");
            IF NoSeriesManagement.SelectSeries(ExampleSetup."Example Nos.", OldExample."No. Series", "No. Series") THEN begin
                NoSeriesManagement.SetSeries("No.");
                Rec := Example;
                EXIT(TRUE);
            end;
        end;
    end;
}
