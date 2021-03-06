class ChargesController < ApplicationController

  def new
  end

  def create

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })


      subscription = Stripe::Subscription.create({
        customer: customer.id,
        plan: "plan_G8FtqbcawJzjs9"
        })

      current_user.stripe_id = customer.id
      current_user.subscription_id = subscription.id
      current_user.stripe_email = customer.email
      current_user.payment = true
      current_user.save

      redirect_to  home_about_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def unsubscribe

    subscription = Stripe::Subscription.update(
    current_user.subscription_id,
    {
      cancel_at_period_end: true,
    })

    current_user.payment = false
    current_user.save

    redirect_to new_charge_path

end

end
