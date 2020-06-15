page 90413 "BH Armstrong Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Armstrong Card';

    trigger OnOpenPage()
    var
        intJ: Integer;
        intl: Integer;
        intPower: Integer;
        intNumber: Integer;
        intResult: Integer;
        intList: List of [Integer];
        MagicNumbers: Text;
    begin
        for intl := 1 to 10000 do begin
            evaluate(intPower, CopyStr(Format(intl), StrLen(Format(intl)), 1));
            for intJ := 1 to StrLen(Format(intl)) do begin
                evaluate(intNumber, CopyStr(Format(intl), intJ, 1));
                intResult += Power(intNumber, intPower);
            end;
            if intResult = intl then
                intList.Add(intResult);
            Clear(intResult);
        end;
        foreach intl in intList do
            MagicNumbers += Format(intl) + '\';
        Message(MagicNumbers);
    end;
}