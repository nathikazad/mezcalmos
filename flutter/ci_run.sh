#!/bin/bash
APP=$1

customer(){
    python3 launcher/launcher.py app=CustomerApp env=prod --build=apk
}
delivery(){
    python3 launcher/launcher.py app=DeliveryApp env=prod --build=apk
}
laundry(){
    python3 launcher/launcher.py app=LaundryApp env=prod --build=apk
}
restaurant(){
    python3 launcher/launcher.py app=RestaurantApp env=prod --build=apk
}
deliveryAdmin(){
    python3 launcher/launcher.py app=DeloiveryAdminApp env=prod --build=apk
}

CMD=customer
echo $APP
if $APP == "customer"; then
    if grep -q "Built build/app/outputs/flutter-apk/app-release.apk" <<< "$customer"; then
        echo "Failed building ❌"
        exit 1
    else
        echo "Successfully built ✅"
        exit 0
    fi
# elif $APP == "delivery"; then
#     if grep -q "Built build/app/outputs/flutter-apk/app-release.apk" <<< "$delivery"; then
#         echo "Failed building ❌"
#         exit 1
#     else
#         echo "Successfully built ✅"
#         exit 0
#     fi
else
    echo "[+] Unsupported App :["
    exit 1
fi
