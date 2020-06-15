codeunit 90435 "BH Reset Customer Credit Limit"
{
    trigger OnRun()
    begin
        Top10Cust.OPEN;
        WHILE Top10Cust.READ DO BEGIN
            Customers.GET(Top10Cust.No);
            TempCustomer := Customers;
            TempCustomer.INSERT;
        END;
        Top10Cust.CLOSE;
        IF PAGE.RUNMODAL(PAGE::"Customer List", TempCustomer) = ACTION::LookupOK THEN
            ConfirmReset;
    end;

    procedure ResetCreditLimit()
    begin
        IF TempCustomer.FINDSET THEN
            REPEAT
                Customers.GET(TempCustomer."No.");
                Customers."Credit Limit (LCY)" := 0;
                Customers.MODIFY;
            UNTIL TempCustomer.NEXT = 0;
        MESSAGE(Text002);
    end;

    procedure ConfirmReset()
    begin
        IF CONFIRM(Text001, FALSE, Customers.FIELDCAPTION("Credit Limit (LCY)"), 0) THEN
            ResetCreditLimit;
    end;

    var

        Customers: Record Customer;
        TempCustomer: Record Customer;
        Top10Cust: Query "BH Top 10 Customer";
        Text001: TextConst ENU = 'Do you want to reset the %1 to %2 for these customers?';
        Text002: TextConst ENU = 'Action completed successfully';

}