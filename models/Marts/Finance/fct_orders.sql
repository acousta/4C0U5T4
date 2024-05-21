WITH orders as (

    select * from {{ ref('stg_orders') }}

),
PAYMENT AS (
    SELECT * FROM {{ ref('stg_stripe__payments')}}
),

final as (

    select
        orders.order_id,
        orders.customer_id,
        payment.AMOUNT,
        payment.status
    from orders

    left join payment using (order_id)
)

select * from final
