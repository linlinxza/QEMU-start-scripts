# QEMU-start-scripts
What I use to run Windows 7 in VFIO Passthrough setup (Setup must be done in Virtual Machine Manager first! Add Spice server for audio!)

Prerequisites:

Barrier (To share host mouse and keyboard)
Kdocker to minimize VM viewer to tray (For audio to be sent to Pulseaudio server)

SETUP:

TO RUN YOUR VM AS NON-ROOT (Required to access the secondary GPU as non-root)

1. For this to work, you'll have to edit the /etc/security/limits.conf file and add this to it:

@kvm             hard    memlock        unlimited
@kvm             soft    memlock        unlimited

2. Then add the current user to the kvm group as root like so: usermod -a -G kvm $(whoami)

3. Make a UDEV rule file or edit existing one like so under: /etc/udev/rules.d/10-qemu-hw-users.rules
   
   3a) Add: SUBSYSTEM=="vfio", OWNER="root", GROUP="kvm"
   
   
