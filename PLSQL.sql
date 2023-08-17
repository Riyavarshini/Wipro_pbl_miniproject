SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
    choice NUMBER;
    trans_type CHAR(1);
BEGIN
    dbms_output.put_line('1.Create new account');
    dbms_output.put_line('2.Transaction');
    dbms_output.put_line('3.Close my account');
    --choice := &enter_your_choice;
    choice := 1;
    CASE 
        WHEN choice = 1 THEN 
            dbms_output.put_line('Creating new account--->');
            --bank_trs.new_acc(&account_number,'&bank_name',&amount);
            bank_trs.new_acc(1000,'CANARA',10000);
        WHEN choice = 2 THEN
            dbms_output.put_line('Choose the kind of transaction:');
            dbms_output.put_line('1.Withdrawal-W');
            dbms_output.put_line('2.Deposit-D');
            --trans_type := &W_or_D;
            trans_type := 'W';
            bank_trs.acc_t(1000,2000,trans_type);
            
        
        WHEN choice = 3 THEN
            dbms_output.put_line('enter your account number to delete :');
            bank_trs.close_acc(3000);
            
            
    END CASE;
    dbms_output.put_line('Thank you!');
    EXCEPTION WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
END;
/
SELECT * FROM AUDIT_T;
SELECT * FROM BANK1;
/
UPDATE BANK1
SET acc_no = 100
WHERE acc_no=1000;
/
DELETE FROM BANK1 WHERE acc_no=100;
/