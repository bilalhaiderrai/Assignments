codeunit 90410 "BH My Statements"
{
    trigger OnRun()
    begin

    end;

    procedure GetSuggestion(var Level: Text[30]; var Suggestion: Text[80]; Difficulty: Integer)
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
}