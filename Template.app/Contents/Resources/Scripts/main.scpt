FasdUAS 1.101.10   ��   ��    k             l      ��  ��   
	This script is automatically generated. It's used to wrap applications that behave poorly.
	Some applications like to force updates or require world read/write permissions, which we
	don't generally like in our sort of environment. This allows us to keep everything locked
	up carefully.
	
	COPYRIGHT (c) 2015 Marriott Library IT Services.  All rights reserved.
	Author:			Pierce Darragh - pierce.darragh@utah.edu
	Creation Date:	May 7, 2015
	Last Updated:		May 12, 2015
	Permission to use, copy, modify, and distribute this software and its documentation for any
	purpose and without fee is hereby granted, provided that the above copyright notice appears in
	all copies and that both that copyright notice and this permission notice appear in supporting
	documentation, and that the name of The Marriott Library not be used in advertising or
	publicity pertaining to distribution of the software without specific, written prior permission.
	This software is supplied as-is without expressed or implied warranties of any kind.
     � 	 	 
 	 T h i s   s c r i p t   i s   a u t o m a t i c a l l y   g e n e r a t e d .   I t ' s   u s e d   t o   w r a p   a p p l i c a t i o n s   t h a t   b e h a v e   p o o r l y . 
 	 S o m e   a p p l i c a t i o n s   l i k e   t o   f o r c e   u p d a t e s   o r   r e q u i r e   w o r l d   r e a d / w r i t e   p e r m i s s i o n s ,   w h i c h   w e 
 	 d o n ' t   g e n e r a l l y   l i k e   i n   o u r   s o r t   o f   e n v i r o n m e n t .   T h i s   a l l o w s   u s   t o   k e e p   e v e r y t h i n g   l o c k e d 
 	 u p   c a r e f u l l y . 
 	 
 	 C O P Y R I G H T   ( c )   2 0 1 5   M a r r i o t t   L i b r a r y   I T   S e r v i c e s .     A l l   r i g h t s   r e s e r v e d . 
 	 A u t h o r : 	 	 	 P i e r c e   D a r r a g h   -   p i e r c e . d a r r a g h @ u t a h . e d u 
 	 C r e a t i o n   D a t e : 	 M a y   7 ,   2 0 1 5 
 	 L a s t   U p d a t e d : 	 	 M a y   1 2 ,   2 0 1 5 
 	 P e r m i s s i o n   t o   u s e ,   c o p y ,   m o d i f y ,   a n d   d i s t r i b u t e   t h i s   s o f t w a r e   a n d   i t s   d o c u m e n t a t i o n   f o r   a n y 
 	 p u r p o s e   a n d   w i t h o u t   f e e   i s   h e r e b y   g r a n t e d ,   p r o v i d e d   t h a t   t h e   a b o v e   c o p y r i g h t   n o t i c e   a p p e a r s   i n 
 	 a l l   c o p i e s   a n d   t h a t   b o t h   t h a t   c o p y r i g h t   n o t i c e   a n d   t h i s   p e r m i s s i o n   n o t i c e   a p p e a r   i n   s u p p o r t i n g 
 	 d o c u m e n t a t i o n ,   a n d   t h a t   t h e   n a m e   o f   T h e   M a r r i o t t   L i b r a r y   n o t   b e   u s e d   i n   a d v e r t i s i n g   o r 
 	 p u b l i c i t y   p e r t a i n i n g   t o   d i s t r i b u t i o n   o f   t h e   s o f t w a r e   w i t h o u t   s p e c i f i c ,   w r i t t e n   p r i o r   p e r m i s s i o n . 
 	 T h i s   s o f t w a r e   i s   s u p p l i e d   a s - i s   w i t h o u t   e x p r e s s e d   o r   i m p l i e d   w a r r a n t i e s   o f   a n y   k i n d . 
   
  
 p         ������ 0 mypath myPath��        p         ������ 0 appname appName��        p         ������ 0 diskname diskName��        p         ������ 0 apppath appPath��        p         ������ 0 	imagepath 	imagePath��        p         ������ 0 
shadowpath 
shadowPath��        p         ������ 0 binname binName��         p       ! ! ������ 0 	mountroot 	mountRoot��      " # " l     ��������  ��  ��   #  $ % $ i      & ' & I     ������
�� .aevtoappnull  �   � ****��  ��   ' k     [ ( (  ) * ) l     �� + ,��   + + % Set all of the locations for things.    , � - - J   S e t   a l l   o f   t h e   l o c a t i o n s   f o r   t h i n g s . *  . / . l     �� 0 1��   0 ^ X Most likely, you'll only ever need to change the 'appName'. If you give everything else    1 � 2 2 �   M o s t   l i k e l y ,   y o u ' l l   o n l y   e v e r   n e e d   t o   c h a n g e   t h e   ' a p p N a m e ' .   I f   y o u   g i v e   e v e r y t h i n g   e l s e /  3 4 3 l     �� 5 6��   5 2 , similar names, it'll make your life easier.    6 � 7 7 X   s i m i l a r   n a m e s ,   i t ' l l   m a k e   y o u r   l i f e   e a s i e r . 4  8 9 8 l     ��������  ��  ��   9  : ; : l     �� < =��   < , & appName:		the name of the application    = � > > L   a p p N a m e : 	 	 t h e   n a m e   o f   t h e   a p p l i c a t i o n ;  ? @ ? l     �� A B��   A &   diskName:		the name of the disk    B � C C @   d i s k N a m e : 	 	 t h e   n a m e   o f   t h e   d i s k @  D E D l     �� F G��   F 9 3 appPath:		the path to the application in the image    G � H H f   a p p P a t h : 	 	 t h e   p a t h   t o   t h e   a p p l i c a t i o n   i n   t h e   i m a g e E  I J I l     �� K L��   K 7 1 imagePath:		the path to the image in this bundle    L � M M b   i m a g e P a t h : 	 	 t h e   p a t h   t o   t h e   i m a g e   i n   t h i s   b u n d l e J  N O N l     �� P Q��   P L F shadowPath:	the path to the shadow file for when the image is mounted    Q � R R �   s h a d o w P a t h : 	 t h e   p a t h   t o   t h e   s h a d o w   f i l e   f o r   w h e n   t h e   i m a g e   i s   m o u n t e d O  S T S l     �� U V��   U M G binName:		the location of the executable binary inside the application    V � W W �   b i n N a m e : 	 	 t h e   l o c a t i o n   o f   t h e   e x e c u t a b l e   b i n a r y   i n s i d e   t h e   a p p l i c a t i o n T  X Y X l     �� Z [��   Z \ V mountRoot:	the location to mount the volume under (change for obnoxious applications)    [ � \ \ �   m o u n t R o o t : 	 t h e   l o c a t i o n   t o   m o u n t   t h e   v o l u m e   u n d e r   ( c h a n g e   f o r   o b n o x i o u s   a p p l i c a t i o n s ) Y  ] ^ ] r     	 _ ` _ l     a���� a I    �� b c
�� .earsffdralis        afdr b  f      c �� d��
�� 
rtyp d m    ��
�� 
utxt��  ��  ��   ` o      ���� 0 mypath myPath ^  e f e r   
  g h g m   
  i i � j j  B a t t l e n e t h o      ���� 0 appname appName f  k l k r     m n m o    ���� 0 appname appName n o      ���� 0 diskname diskName l  o p o r     q r q b     s t s b     u v u b     w x w b     y z y m     { { � | |  V o l u m e s : z o    ���� 0 appname appName x m     } } � ~ ~  : v o    ���� 0 appname appName t m       � � �  . a p p r o      ���� 0 apppath appPath p  � � � r    / � � � c    - � � � n    + � � � 1   ) +��
�� 
psxp � l   ) ����� � b    ) � � � b    ' � � � b    % � � � b    # � � � b    ! � � � o    ���� 0 mypath myPath � m      � � � � �  : � o   ! "���� 0 appname appName � m   # $ � � � � � 0 . a p p : C o n t e n t s : R e s o u r c e s : � o   % &���� 0 appname appName � m   ' ( � � � � �  . d m g��  ��   � m   + ,��
�� 
utxt � o      ���� 0 	imagepath 	imagePath �  � � � r   0 ? � � � b   0 ; � � � b   0 7 � � � n   0 5 � � � 1   3 5��
�� 
psxp � m   0 3 � � � � �  t m p : � o   5 6���� 0 appname appName � m   7 : � � � � �  . s h a d o w � o      ���� 0 
shadowpath 
shadowPath �  � � � r   @ M � � � n   @ I � � � 1   G I��
�� 
psxp � l  @ G ����� � b   @ G � � � b   @ E � � � o   @ A���� 0 apppath appPath � m   A D � � � � �   : C o n t e n t s : M a c O S : � o   E F���� 0 appname appName��  ��   � o      ���� 0 binname binName �  � � � r   N U � � � m   N Q � � � � �  / V o l u m e s � o      ���� 0 	mountroot 	mountRoot �  ��� � n  V [ � � � I   W [�������� 0 main  ��  ��   �  f   V W��   %  � � � l     ��������  ��  ��   �  � � � i     � � � I      �������� 0 main  ��  ��   � k     % � �  � � � l     �� � ���   � + % If the application is running, quit.    � � � � J   I f   t h e   a p p l i c a t i o n   i s   r u n n i n g ,   q u i t . �  � � � l     �� � ���   �   Otherwise, launch it!    � � � � ,   O t h e r w i s e ,   l a u n c h   i t ! �  ��� � Z     % � ��� � � l     ����� � I     �������� 0 	isrunning 	isRunning��  ��  ��  ��   � k     � �  � � � I   �� � �
�� .sysodlogaskr        TEXT � l    ����� � b     � � � o    	���� 0 appname appName � m   	 
 � � � � � (   i s   a l r e a d y   r u n n i n g !��  ��   � �� � �
�� 
btns � J     � �  ��� � m     � � � � � 0 T h a n k s   f o r   t h e   r e m i n d e r !��   � �� � �
�� 
dflt � m    ����  � �� � �
�� 
givu � m    ����  � �� ���
�� 
disp � m    ��
�� stic   ��   �  ��� � L    ����  ��  ��   � I   %�� ���
�� .ascrnoop****      � **** � J    !����  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �    Launches the application.    � � � � 4   L a u n c h e s   t h e   a p p l i c a t i o n . �  � � � i     � � � I     �� ���
�� .ascrnoop****      � **** � J      ����  ��   � k     � � �  � � � l     �� � ���   � L F Inform the user that this might take a moment (mounting a disk image)    � � � � �   I n f o r m   t h e   u s e r   t h a t   t h i s   m i g h t   t a k e   a   m o m e n t   ( m o u n t i n g   a   d i s k   i m a g e ) �  � � � I    �� � 
�� .sysodlogaskr        TEXT � m      �� T h i s   a p p l i c a t i o n   m a y   t a k e   a   w h i l e   t o   l o a d . 
 R e m e m b e r   t h a t   n o n e   o f   y o u r   d a t a   w i l l   b e   s a v e d   o n c e   y o u   l o g   o f f .     B a c k   u p   a n y t h i n g   y o u   n e e d   b e f o r e   y o u   l e a v e ! 
 	 
 - -   M a c   S u p p o r t   G r o u p 
 M a r r i o t t   L i b r a r y   I T   S e r v i c e s  ��
�� 
btns J     �� m     �  O k a y��   ��	

�� 
dflt	 m    ���� 
 ����
�� 
disp I   ��
�� .sysorpthalis        TEXT l   ���� b     o    	���� 0 appname appName m   	 
 � 
 . i c n s��  ��   ����
�� 
in B l   ���� I   ��~
� .earsffdralis        afdr  f    �~  ��  ��  ��  ��   �  l   �}�|�{�}  �|  �{    l   �z�z   , & If the disk is not mounted, mount it.    � L   I f   t h e   d i s k   i s   n o t   m o u n t e d ,   m o u n t   i t .  l   �y �y   B < If after this the path to the executable exists, launch it.     �!! x   I f   a f t e r   t h i s   t h e   p a t h   t o   t h e   e x e c u t a b l e   e x i s t s ,   l a u n c h   i t . "�x" O    �#$# k    �%% &'& Z    }()�w�v( H    '** l   &+�u�t+ I   &�s,�r
�s .coredoexbool        obj , 4    "�q-
�q 
cdis- o     !�p�p 0 diskname diskName�r  �u  �t  ) k   * y.. /0/ l  * *�o12�o  1 ) # Mount the image at imagePath with:   2 �33 F   M o u n t   t h e   i m a g e   a t   i m a g e P a t h   w i t h :0 454 l  * *�n67�n  6 U O  * -nobrowse			Prevents the volume from appearing in Finder or on the Desktop.   7 �88 �     *   - n o b r o w s e 	 	 	 P r e v e n t s   t h e   v o l u m e   f r o m   a p p e a r i n g   i n   F i n d e r   o r   o n   t h e   D e s k t o p .5 9:9 l  * *�m;<�m  ; c ]  * -noautoopenro		Makes sure we won't accidentally pop open a Finder window into the volume.   < �== �     *   - n o a u t o o p e n r o 	 	 M a k e s   s u r e   w e   w o n ' t   a c c i d e n t a l l y   p o p   o p e n   a   F i n d e r   w i n d o w   i n t o   t h e   v o l u m e .: >?> l  * *�l@A�l  @ ^ X  * -noverify				Ensures that hdiutil will not verify the volume. Speeds up mount times.   A �BB �     *   - n o v e r i f y 	 	 	 	 E n s u r e s   t h a t   h d i u t i l   w i l l   n o t   v e r i f y   t h e   v o l u m e .   S p e e d s   u p   m o u n t   t i m e s .? CDC l  * *�kEF�k  E > 8  * -mountroot			Changes where the volume is mounted to.   F �GG p     *   - m o u n t r o o t 	 	 	 C h a n g e s   w h e r e   t h e   v o l u m e   i s   m o u n t e d   t o .D HIH l  * *�jJK�j  J � �  * -shadow 				Allows read/write access by creating a file the user can edit and shadowing what would have been the edits there.   K �LL     *   - s h a d o w   	 	 	 	 A l l o w s   r e a d / w r i t e   a c c e s s   b y   c r e a t i n g   a   f i l e   t h e   u s e r   c a n   e d i t   a n d   s h a d o w i n g   w h a t   w o u l d   h a v e   b e e n   t h e   e d i t s   t h e r e .I MNM I  * Q�iO�h
�i .sysodlogaskr        TEXTO l  * MP�g�fP b   * MQRQ b   * ESTS b   * AUVU b   * 9WXW b   * 5YZY m   * -[[ �\\ x h d i u t i l   a t t a c h   - n o b r o w s e   - n o a u t o o p e n r o   - n o v e r i f y   - m o u n t r o o t  Z n   - 4]^] 1   0 4�e
�e 
strq^ o   - 0�d�d 0 	mountroot 	mountRootX m   5 8__ �``    - s h a d o w  V n   9 @aba 1   < @�c
�c 
strqb o   9 <�b�b 0 
shadowpath 
shadowPathT m   A Dcc �dd   R n   E Lefe 1   H L�a
�a 
strqf o   E H�`�` 0 	imagepath 	imagePath�g  �f  �h  N g�_g I  R y�^h�]
�^ .sysoexecTEXT���     TEXTh l  R ui�\�[i b   R ujkj b   R mlml b   R inon b   R apqp b   R ]rsr m   R Utt �uu x h d i u t i l   a t t a c h   - n o b r o w s e   - n o a u t o o p e n r o   - n o v e r i f y   - m o u n t r o o t  s n   U \vwv 1   X \�Z
�Z 
strqw o   U X�Y�Y 0 	mountroot 	mountRootq m   ] `xx �yy    - s h a d o w  o n   a hz{z 1   d h�X
�X 
strq{ o   a d�W�W 0 
shadowpath 
shadowPathm m   i l|| �}}   k n   m t~~ 1   p t�V
�V 
strq o   m p�U�U 0 	imagepath 	imagePath�\  �[  �]  �_  �w  �v  ' ��� l  ~ ~�T�S�R�T  �S  �R  � ��� l  ~ ~�Q�P�O�Q  �P  �O  � ��� l  ~ ~�N���N  � ' ! Launch the app for the user too.   � ��� B   L a u n c h   t h e   a p p   f o r   t h e   u s e r   t o o .� ��M� Z   ~ ����L�K� I  ~ ��J��I
�J .coredoexbool        obj � o   ~ ��H�H 0 apppath appPath�I  � I  � ��G��F
�G .aevtodocnull  �    alis� o   � ��E�E 0 apppath appPath�F  �L  �K  �M  $ m    ���                                                                                  MACS  alis    h  Mac OS X                   ��ʜH+   �4�
Finder.app                                                      ��d�uj�        ����  	                CoreServices    ���      �u��     �4� �4t �4s  2Mac OS X:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c   O S   X  &System/Library/CoreServices/Finder.app  / ��  �x   � ��� l     �D�C�B�D  �C  �B  � ��� l     �A���A  � ] W Returns a boolean telling whether the application is currently running from the image.   � ��� �   R e t u r n s   a   b o o l e a n   t e l l i n g   w h e t h e r   t h e   a p p l i c a t i o n   i s   c u r r e n t l y   r u n n i n g   f r o m   t h e   i m a g e .� ��� i    ��� I      �@�?�>�@ 0 	isrunning 	isRunning�?  �>  � Q     ���� k    �� ��� r    ��� l   ��=�<� I   �;��:
�; .sysoexecTEXT���     TEXT� b    ��� b    ��� m    �� ���  p g r e p   - f   '� o    �9�9 0 binpath binPath� m    �� ���  '�:  �=  �<  � o      �8�8 0 	psresults 	psResults� ��7� L    �� m    �6
�6 boovtrue�7  � R      �5�4�3
�5 .ascrerr ****      � ****�4  �3  � L    �� m    �2
�2 boovfals� ��1� l     �0�/�.�0  �/  �.  �1       �-������ i i���� ��,�+�*�)�-  � �(�'�&�%�$�#�"�!� �������
�( .aevtoappnull  �   � ****�' 0 main  
�& .ascrnoop****      � ****�% 0 	isrunning 	isRunning�$ 0 mypath myPath�# 0 appname appName�" 0 diskname diskName�! 0 apppath appPath�  0 	imagepath 	imagePath� 0 
shadowpath 
shadowPath� 0 binname binName� 0 	mountroot 	mountRoot�  �  �  �  � � '�����
� .aevtoappnull  �   � ****�  �  �  � ���� i�� { } � � � ��� � �� ��
 ��	�
� 
rtyp
� 
utxt
� .earsffdralis        afdr� 0 mypath myPath� 0 appname appName� 0 diskname diskName� 0 apppath appPath
� 
psxp� 0 	imagepath 	imagePath� 0 
shadowpath 
shadowPath�
 0 binname binName�	 0 	mountroot 	mountRoot� 0 main  � \)��l E�O�E�O�E�O��%�%�%�%E�O��%�%�%�%�%�,�&E�Oa �,�%a %E` O�a %�%�,E` Oa E` O)j+ � � ������� 0 main  �  �  �  � �� �� �� ��������������� 0 	isrunning 	isRunning� 0 appname appName
� 
btns
�  
dflt
�� 
givu�� 
�� 
disp
�� stic   �� 
�� .sysodlogaskr        TEXT
�� .ascrnoop****      � ****� &*j+   ��%��kv�k����� OhY jvj � �� ���������
�� .ascrnoop****      � ****��  ��  �  � �������������������������[����_��c��tx|������
�� 
btns
�� 
dflt
�� 
disp�� 0 appname appName
�� 
in B
�� .earsffdralis        afdr
�� .sysorpthalis        TEXT�� 
�� .sysodlogaskr        TEXT
�� 
cdis�� 0 diskname diskName
�� .coredoexbool        obj �� 0 	mountroot 	mountRoot
�� 
strq�� 0 
shadowpath 
shadowPath�� 0 	imagepath 	imagePath
�� .sysoexecTEXT���     TEXT�� 0 apppath appPath
�� .aevtodocnull  �    alis�� ����kv�k���%�)j l 	� O� w*��/j  Ta _ a ,%a %_ a ,%a %_ a ,%j Oa _ a ,%a %_ a ,%a %_ a ,%j Y hO_ j  _ j Y hU� ������������� 0 	isrunning 	isRunning��  ��  � ������ 0 binpath binPath�� 0 	psresults 	psResults� ��������
�� .sysoexecTEXT���     TEXT��  ��  ��  �%�%j E�OeW 	X  f� ��� � D a t a : U s e r s : u 0 7 3 4 8 6 9 : D e s k t o p : C u r r e n t P r o j e c t s : c r a p p   a p p : T e m p l a t e   G o l d e n : T e m p l a t e . a p p :� ��� > V o l u m e s : B a t t l e n e t : B a t t l e n e t . a p p� ��� � / V o l u m e s / D a t a / U s e r s / u 0 7 3 4 8 6 9 / D e s k t o p / C u r r e n t P r o j e c t s / c r a p p   a p p / T e m p l a t e   G o l d e n / B a t t l e n e t . a p p / C o n t e n t s / R e s o u r c e s / B a t t l e n e t . d m g� ��� * / t m p / B a t t l e n e t . s h a d o w� ��� r / V o l u m e s / B a t t l e n e t / B a t t l e n e t . a p p / C o n t e n t s / M a c O S / B a t t l e n e t�,  �+  �*  �)   ascr  ��ޭ