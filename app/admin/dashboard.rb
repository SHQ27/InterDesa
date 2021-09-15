ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Latest payments" do
          latestPayments = Payment.latestPayments
          if latestPayments.length > 0
            table_for latestPayments.each do
              column "Payment" do |p|
                link_to "#{p.name}", admin_payment_path(p)
              end
              column "PaymentPlan" do |p|
                link_to "#{p.payment_plan.name}", admin_payment_plan_path(p.payment_plan)
              end
              column "Unit" do |p|
                link_to "#{p.payment_plan.unit.name}", admin_unit_path(p.payment_plan.unit)
              end
              column "Building" do |p|
                link_to "#{p.payment_plan.unit.building.name}", admin_building_path(p.payment_plan.unit.building)
              end
              column "Client" do |p|
                link_to "#{p.payment_plan.client.name} #{p.payment_plan.client.lastname}", admin_client_path(p.payment_plan.client)
              end
              column :due
              column :paid_at
            end
          else
            "No payments yet."
          end
        end
      end
      column do
        panel "Overdue payments" do
          duePayments = Payment.duePayments
          if duePayments.length > 0
            table_for duePayments.each do
              column "Payment" do |p|
                link_to "#{p.name}", admin_payment_path(p)
              end
              column "PaymentPlan" do |p|
                link_to "#{p.payment_plan.name}", admin_payment_plan_path(p.payment_plan)
              end
              column "Unit" do |p|
                link_to "#{p.payment_plan.unit.name}", admin_unit_path(p.payment_plan.unit)
              end
              column "Building" do |p|
                link_to "#{p.payment_plan.unit.building.name}", admin_building_path(p.payment_plan.unit.building)
              end
              column :due
              column :paid_at
            end
          else
            "No overdue payments."
          end
        end
      end
    end
    columns do
      column do
        panel "Buildings" do
          buildings = Building.all
          if buildings.length > 0
            table_for buildings.each do
              column "Name" do |b|
                link_to "#{b.name}", admin_building_path(b)
              end
              column :address
              column "Total units" do |b|
                b.units.length
              end
              column "Sold units" do |b|
                b.getSoldUnits
              end
              column "Remaining units" do |b|
                b.getRemainingUnits
              end
            end
          else
            "No buildings yet."
          end
        end
      end
    end
  end
end
