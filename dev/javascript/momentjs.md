Moment.js
=========

http://momentjs.com/docs/

- `m.` refers to an instance of `moment()`.
- Amounts can be overloaded, eg: `.hour(48)` is 2 days, `.day(-7)` is last Sunday
- When chaining, set year, then month, then day, etc. Otherwise dates may overload in unexpected ways.
- Moment parses and displays in local time by default. Use `m.utc()` to set to UTC mode, and `m.local()` to switch back. 
- All moments are mutable. Use `m.clone()` or `moment(m)`
- For code accepting `m2`, it (usually) also supports anything that can be parsed (eg: string, object, array, date, etc) 

Parse
-----

- For strict parsing (recommended), pass `true` as the final param
- Omitted units default to 0 for current date, month, and year.

```
moment("12-25-1995"); // ISO 8601, or falls back to JS `Date.parse()` which differs between browser implementation
moment("12-25-1995", "MM-DD-YYYY"); // Format tokens: http://momentjs.com/docs/#/parsing/string-format/

moment({ hour:15, minute:10 });
moment({ y    :2010, M     :3, d   :5, h    :15, m      :10, s      :3, ms          :123});
moment({ year :2010, month :3, day :5, hour :15, minute :10, second :3, millisecond :123});
moment({ years:2010, months:3, days:5, hours:15, minutes:10, seconds:3, milliseconds:123});
moment({ years:2010, months:3, date:5, hours:15, minutes:10, seconds:3, milliseconds:123});
// `day` and `date` both mean day-of-the-month.

moment([year, month, day, hour, minute, second, millisecond]);
moment([2010]);        // January 1st
moment([2010, 6]);     // July 1st
moment([2010, 6, 10]); // July 10th

moment(unixTimestampMilliseconds)
moment(new Date());
moment(momentInstance);
```

### Validation

```
moment("not a real date"); // false
m.isValid(); // false
m.parsingFlags(); // more details
```

Get + Set
---------

- Act as 'getter' when called without a parameter
- Functions work as both singular and plural (only singular shown below)

```
m.millisecond(0 - 999);
m.second(0 - 59);
m.minute(0 - 59);
m.hour(0 - 23);
m.date(1 - 31);
m.day(0 - 6); // 0 = Sunday, 6 = Saturday
m.day('Sunday');
m.weekday(0 - 6); // Locale aware, 0 = Monday | Sunday
m.isoWeekDay(1 - 7); // 1 = Monday, 7 = Sunday 
m.isoWeekday('Sunday');
m.dayOfYear(Number); // 0 - 366
m.week(0 - 52);
m.isoWeek(0 - 52);
m.month(0 - 11);
m.month('January');
m.month('Feb');
m.quarter(1 - 4);
m.year(2000);
m.weekYear(0);
m.isoWeekYear(0);
m.unix(unixTimestamp);

// With strings
// Case insensitive, many flavours: singular (year), plural (years), short form (y)
m.get('something'); 
m.set('something', x);
m.set({ 'something1': x, 'something2': x });

m.format(); // ISO 8601
m.format("dddd, MMMM Do YYYY, h:mm:ss a"); // Tokens: http://momentjs.com/docs/#/displaying/format/

m.diff(m2); // in milliseconds
m.diff(m2, 'years'); // years, months, weeks, days, hours, minutes, seconds, milliseconds (and singular)

// GETTERS ONLY:

m.valueOf(); // Unix timestamp with milliseconds
m.weeksInYear();
m.isoWeeksInYear();
m.daysInMonth()
m.toDate() // Native `Date` object
m.toArray() // Mirrors params of `new Date()`, eg: [2013, 1, 4, 14, 40, 16, 154]
m.toJSON()
m.toISOString()
m.toObject() // { years, months, date, hours, minutes, seconds, milliseconds }
m.toString() // Similar to `Date.toString()`, eg: Sat Apr 30 2016 16:59:46 GMT-0500
```

Manipulate
----------

```
m.add(7, 'days'); // years, quarter, months, weeks, days, hours, minutes, seconds, milliseconds
m.add(7, 'd'); // y, Q, M, w, d, h, m, s, ms
m.add({ days: 7, months: 1 });
m.add(d);

m.subtract(); // same as add

m.startOf('year');    // January 1st, 12:00 am this year
m.startOf('month');   // First of this month, 12:00 am
m.startOf('quarter'); // Beginning of the current quarter, 1st day of months, 12:00 am
m.startOf('week');    // First day of this week, 12:00 am
m.startOf('isoWeek'); // First day of this week according to ISO 8601, 12:00 am
m.startOf('day');     // 12:00 am today
m.startOf('date');    // 12:00 am today
m.startOf('hour');    // Now with 0 mins, 0 secs, and 0 ms
m.startOf('minute');  // Now with 0 secs and 0 ms
m.startOf('second');  // Now with 0 ms

m.endOf(); // same as startOf
```

Relative
--------

```
m.fromNow();     // 4 years ago
m.fromNow(true); // 4 years
m.from(m2); // a day ago
m.from(m2, true); // a day
m.toNow();      // in 4 years
m.toNow(true);  // 4 years
m.to(m2);       // in a day
m.to(m2, true); // a day

// Last Monday at 2:30 AM, Yesterday at 2:30 AM, Today at 2:30 AM, Tomorrow at 2:30 AM, Sunday at 2:30 AM, 7/10/2011
m.calendar();
m.calendar(m2);

// Customize it:
m.calendar(null, {
  sameDay:  '[Today]',
  nextDay:  '[Tomorrow]',
  nextWeek: 'dddd',
  lastDay:  '[Yesterday]',
  lastWeek: '[Last] dddd',
  sameElse: 'DD/MM/YYYY'
});

m.calendar(null, {
  sameDay: function (now) {
    if (this.isBefore(now)) {
      return '[Will Happen Today]';
    } else {
      return '[Happened Today]';
    }
  }
});
```

Query
-----

```
m.isBefore(); // boolean, is before current time?
m.isBefore(m2);
m.isBefore(m2, 'year'); //year, month, week, day, hour, minute, second

// The following work in the same way:
m.isSame();
m.isAfter();
m.isSameOrBefore();
m.isSameOrAfter();

m.isBetween(m1, m2);
m.isBetween(m1, m2, 'year');
m.isBetween(m1, m2, null, '[)'); // `[` or `]` = inclusive, `(` or `)` = exclusive, `()` by default

m.isDST();
m.isLeapYear()

m.max(m2[, m3...]); // Returns m instance
m.max(m[]); // Returns m instance
m.min(m2[,m3...]); // Returns m instance
m.min(m[]); // Returns m instance
```

Durations
---------

- Lengths of time
- No defined beginning or end date
- Eg: '2 hours' or 'Between 2pm and 4pm today'
- `d.` refers to a duration instance

```
m.duration(100); // 100 ms
m.duration(2, 'seconds'); // years, months, weeks, days, hours, minutes, seconds, milliseconds
m.duration(2, 's'); // y, M, w, d, h, m, s, ms
m.duration({ seconds, minutes, hours, days, weeks, months, years });

d.milliseconds(); // milliseconds in a duration (0 - 999)
d.asMilliseconds(); // length of duration in milliseconds
d.seconds();
d.asSeconds();
d.minutes();
d.asMinutes();
d.hours();
d.asHours();
d.days();
d.asDays();
d.weeks();
d.asWeeks();
d.months();
d.asMonths();
d.years();
d.asYears();

d.get('x'); // milliseconds, seconds, minutes, hours, days, weeks, months, years
d.as('x'); // milliseconds, seconds, minutes, hours, days, weeks, months, years

d.add() // same as m.add()
d.subtract() // same as m.subtract()

d.humanize(); // a minute
d.humanize(true); // in a minute, a minute ago

d.toJSON()
```
