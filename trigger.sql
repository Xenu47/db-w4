create or replace trigger add_category instead of delete
    on app_view for each row
   
begin
    if deleting then
        insert into appcategory(app_name, app_category)
        values(:old.app_name, 'DELETED');
        dbms_output.put_line('Nothing is deleted, just added category "DELETED" to AppCategory table!');
    end if;
    exception
        when others then
            if ( substr(sqlerrm, 0, 9) = 'ORA-00001' ) then
                dbms_output.put_line('This app is already deleted! (has a "DELETED" category)');
            end if;
end;