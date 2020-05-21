create view app_view as
    select
        app_name,
        app_size
    from
        app;