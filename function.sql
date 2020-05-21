create type appDetails is object(
        app_name varchar(255),
        app_size varchar(20)
    );

/

create type t_appDetails is table of appDetails;

/

create or replace function getApp(
        lastUpdated varchar,
        currentVer varchar
    )
    return t_appDetails
        pipelined
    is
        cursor cur is(
            select
                app_name,
                app_size
            from
                app
            where
                last_updated = lastUpdated
                and current_ver = currentVer
            );
    appRec appDetails;
    begin
        for rec in cur loop
            appRec.app_name := rec.app_name;
            appRec.app_size := rec.app_size;
            pipe row(appRec);
        end loop;
    end;