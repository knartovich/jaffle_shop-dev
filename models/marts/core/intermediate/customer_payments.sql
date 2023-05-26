with payments as (

    select * from {{ ref('stg_payments') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

final as (

    select
        orders.customer_id,
        sum(amount) as total_amount
        orders.order_date

    from payments

    left join orders using (order_id)

    group by 1

)

select * from final
