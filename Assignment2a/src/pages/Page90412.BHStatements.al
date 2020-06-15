page 90412 "BH Statement Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Statements Card';
    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(Difficulty; Difficulty)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        MyStatements.GetSuggestion(Level, Suggestion, Difficulty);
                    end;
                }
                field(Level; Level)
                {
                    ApplicationArea = All;
                }
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;
                }

            }
            group(Output)
            {
                field(Result; Result)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    local procedure GetSuggestion()
    begin
        Level := '';
        Suggestion := '';
        case Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginner';
                    Suggestion := 'Take e-Learning or remote training';
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend instructor-Led';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend Instructor-Led and Self study';
                end;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        MyStatements.GetSuggestion(Level, Suggestion, Difficulty);
    end;

    var
        Level: Text[30];
        Suggestion: Text[80];
        Difficulty: Integer;
        Result: Boolean;
        MyStatements: Codeunit "BH My Statements";
}