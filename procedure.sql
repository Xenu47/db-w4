create or replace procedure updateGenre(
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
        dbms_output.put_line('App or genre does not exist!');
    when others then
        dbms_output.put_line('Something else went wrong - '
                             || sqlcode
                             || ' : '
                             || sqlerrm);
end;
