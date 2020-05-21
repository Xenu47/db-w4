create or replace package appPackage is
    type appDetails is record (
        app_name app_view.app_name%type,
        app_size app_view.app_size%type
    );
    type t_appDetails is table of appDetails;
    
    function getApp(
        lastUpdated varchar,
        currentVer varchar
    )
    return t_appDetails
        pipelined;

    procedure updateGenre(
        appName varchar,
        genreName varchar
    );

end appPackage;

/

create or replace package body appPackage is

procedure updateGenre(
    appName varchar,
    genreName varchar
) as
app_status number;
genre_status number;
no_data exception;

begin
    select
        count(*)
    into app_status
    from
        appGenre
    where
        app_name = appName;

    select
        count(*)
    into genre_status
    from
        appGenre
    where
        app_genre = genreName;

    if (app_status = 1) and (genre_status = 1)  then
    update appGenre
        set
            app_genre = genreName
        where
            app_name = appName;

    else
        raise no_data;

    end if;

exception
    when no_data then
        dbms_output.put_line('App or genre does not exist');
    when others then
        dbms_output.put_line('Something else went wrong - '
                             || sqlcode
                             || ' : '
                             || sqlerrm);
end;


function getApp(
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
end;