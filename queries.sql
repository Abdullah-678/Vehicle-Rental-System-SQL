
-- Query 1:JOIN
select
  bookings.booking_id,
  users.name as customer_name,
  vehicles.name as vehicle_name,
  bookings.start_date,
  bookings.end_date,
  bookings.status
from
  bookings
  inner join users on bookings.user_id = users.user_id
  inner join vehicles on bookings.vehicle_id = vehicles.vehicle_id;

-- Query 2:EXISTS
select
  v.vehicle_id,
  v.name,
  v.type,
  v.model,
  v.registration_number,
  v.rental_price,
  v.status
from
  vehicles v
where
  not exists (
    select
      *
    from
      bookings b
    where
      b.vehicle_id = v.vehicle_id
  ) and v.status <> 'rented';

  -- Query 3: WHERE
  select
  *
from
  vehicles
where
  status = 'available'
  and
type
  = 'car';

select
  *
from
  vehicles
where
  status = 'available'
  and
type
  = 'bike';


select
  *
from
  vehicles
where
  status = 'available'
  and
type
  = 'truck';

  -- Query 4: GROUP BY and HAVING
 select
  v.name as vehicle_name,
  count(b.booking_id) as total_bookings
from
  vehicles v
  join bookings b on v.vehicle_id = b.vehicle_id
group by
  v.vehicle_id
having
  count(b.booking_id) > 2;