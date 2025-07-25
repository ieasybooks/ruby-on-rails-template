class Components::Flash < Components::Base
  def view_template
    div(class: "sm:container px-4 sm:px-4") do
      flash.each do |type, message|
        next unless message.is_a?(String)

        if type == "notice"
          Alert(variant: :success, dismissible: true, class: "mt-4") do
            Hero::CheckCircle(class: "mt-px size-6")

            AlertDescription(class: "mt-1.5 me-4") { message }
          end
        elsif type == "alert"
          Alert(variant: :destructive, dismissible: true, class: "mt-4") do
            Hero::ExclamationTriangle(class: "mt-px size-6")

            AlertDescription(class: "mt-1.5 me-4") { raw(safe(message)) }
          end
        end
      end
    end
  end
end
