# Hamilton Pay Assignment
How I went about solving the assignment.
+ Enviornment using asdf
+ `phx.gen.auth` to generate authentication related code
+ Necessary changes to accomodate the `username` field and its validation
+ For toggling the password field I tried a few things but ended up sticing to a mix of both while being simple.
    + Javascript inside heex template but that did not work if page is visited from a different route
    + Purely server side using 'phx-click' but that required handling of password state and dont think dealing with plaintext password serverside is a good idea
    + Mixed of both a javascript `~S` block method inside heex template `on-click`
+ Simply `@current_user.username` is used to query the username.

Pheonix is one of the most beautiful framework I have ever tried and also one with very sparse resources to start with(`1.7.7`).