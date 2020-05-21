set serveroutput on
begin
    appPackage.updateGenre('asd', 'Action'); -- null
    appPackage.updateGenre('Bubble', 'asd'); -- null
    appPackage.updateGenre('DB Browser', 'Action');
end;

/

select * from table(appPackage.getApp('asd', '1.0.0')); -- null
select * from table(appPackage.getApp('January 15, 2018', 'asd')); -- null
select * from table(appPackage.getApp('August 1, 2019', '1.2.4'));

/

delete from app_view where app_name = 'Bubble';
delete from app_view where app_name = 'Oracle SQL Developer complains archive';
