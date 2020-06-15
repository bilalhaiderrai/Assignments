codeunit 90411 "BH My Validations"
{
    procedure CheckForPlusSign(TextToVerify: Text)
    begin
        IF StrPos(TextToVerify, '+') <> 0 then
            Message('A + sign cannot be used');
    end;

    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnAfterValidateEvent', 'Address', false, false)]
    local procedure OnCustomerPageAddressValidate(var Rec: Record Customer; var xRec: Record Customer)
    begin
        CheckForPlusSign(Rec.Address);
    end;
}