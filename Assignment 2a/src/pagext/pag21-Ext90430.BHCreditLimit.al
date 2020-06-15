pageextension 90430 "BH Credit Limit" extends "Customer Card"
{
    actions
    {
        addafter("F&unctions")
        {
            action(UpdateCreditLimit)
            {
                ApplicationArea = All;
                Caption = 'Update Credit Limit';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = CalculateCost;
                trigger OnAction()
                begin
                    CallUpdateCreditLimit();
                end;
            }
        }
    }
    procedure CallUpdateCreditLimit()
    var
        Text90001: TextConst ENU = 'Are you sure you want to set the %1 to %2 ?';
        Text90002: TextConst ENU = 'The credit limit was rounded to %1 to comply with company policies.';
        Text90003: TextConst ENU = 'The credit limit is up to date';
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit();
        If CreditLimitCalculated = Rec."Credit Limit (LCY)" then
            Message(Text90003);
        exit;
        IF GUIALLOWED AND NOT CONFIRM(Text90001, FALSE, FIELDCAPTION("Credit Limit (LCY)"), CreditLimitCalculated) THEN
            exit;
        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        IF CreditLimitActual <> CreditLimitCalculated THEN
            MESSAGE(Text90002, CreditLimitActual);
        CallUpdateCreditLimit();
        CreditLimitCalculated := Rec.CalculateCreditLimit;
        IF CreditLimitCalculated = Rec."Credit Limit (LCY)" THEN BEGIN
            MESSAGE(Text90003);
            EXIT;
        END;
        IF GUIALLOWED AND NOT CONFIRM(Text90001, FALSE, FIELDCAPTION("Credit Limit (LCY)"), CreditLimitCalculated) THEN
            EXIT;
        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        IF CreditLimitActual <> CreditLimitCalculated THEN
            MESSAGE(Text90002, CreditLimitActual);

    end;
}