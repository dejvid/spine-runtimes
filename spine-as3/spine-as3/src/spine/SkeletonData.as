/******************************************************************************
 * Spine Runtimes Software License
 * Version 2.1
 * 
 * Copyright (c) 2013, Esoteric Software
 * All rights reserved.
 * 
 * You are granted a perpetual, non-exclusive, non-sublicensable and
 * non-transferable license to install, execute and perform the Spine Runtimes
 * Software (the "Software") solely for internal use. Without the written
 * permission of Esoteric Software (typically granted by licensing Spine), you
 * may not (a) modify, translate, adapt or otherwise create derivative works,
 * improvements of the Software or develop new applications using the Software
 * or (b) remove, delete, alter or obscure any trademarks or any copyright,
 * trademark, patent or other intellectual property or proprietary rights
 * notices on or in the Software, including any copy thereof. Redistributions
 * in binary or source form must include this license and terms.
 * 
 * THIS SOFTWARE IS PROVIDED BY ESOTERIC SOFTWARE "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 * EVENT SHALL ESOTERIC SOFTARE BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *****************************************************************************/

package spine {
import spine.animation.Animation;

public class SkeletonData {
	/** May be null. */
	public var name:String;
	public var bones:Vector.<BoneData> = new Vector.<BoneData>(); // Ordered parents first.
	public var slots:Vector.<SlotData> = new Vector.<SlotData>(); // Setup pose draw order.
	public var skins:Vector.<Skin> = new Vector.<Skin>();
	public var defaultSkin:Skin;
	public var events:Vector.<EventData> = new Vector.<EventData>();
	public var animations:Vector.<Animation> = new Vector.<Animation>();
	public var ikConstraints:Vector.<IkConstraintData> = new Vector.<IkConstraintData>();
	public var width:Number, height:Number;
	public var version:String, hash:String;

	// --- Bones.

	/** @return May be null. */
	public function findBone (boneName:String) : BoneData {
		if (boneName == null) throw new ArgumentError("boneName cannot be null.");
		for (var i:int = 0, n:int = bones.length; i < n; i++) {
			var bone:BoneData = bones[i];
			if (bone._name == boneName) return bone;
		}
		return null;
	}

	/** @return -1 if the bone was not found. */
	public function findBoneIndex (boneName:String) : int {
		if (boneName == null) throw new ArgumentError("boneName cannot be null.");
		for (var i:int = 0, n:int = bones.length; i < n; i++)
			if (bones[i]._name == boneName) return i;
		return -1;
	}

	// --- Slots.

	/** @return May be null. */
	public function findSlot (slotName:String) : SlotData {
		if (slotName == null) throw new ArgumentError("slotName cannot be null.");
		for (var i:int = 0, n:int = slots.length; i < n; i++) {
			var slot:SlotData = slots[i];
			if (slot._name == slotName) return slot;
		}
		return null;
	}

	/** @return -1 if the bone was not found. */
	public function findSlotIndex (slotName:String) : int {
		if (slotName == null) throw new ArgumentError("slotName cannot be null.");
		for (var i:int = 0, n:int = slots.length; i < n; i++)
			if (slots[i]._name == slotName) return i;
		return -1;
	}

	// --- Skins.

	/** @return May be null. */
	public function findSkin (skinName:String) : Skin {
		if (skinName == null) throw new ArgumentError("skinName cannot be null.");
		for each (var skin:Skin in skins)
			if (skin._name == skinName) return skin;
		return null;
	}
	
	// --- Events.
	
	/** @return May be null. */
	public function findEvent (eventName:String) : EventData {
		if (eventName == null) throw new ArgumentError("eventName cannot be null.");
		for each (var eventData:EventData in events)
			if (eventData._name == eventName) return eventData;
		return null;
	}
	
	// --- Animations.
	
	/** @return May be null. */
	public function findAnimation (animationName:String) : Animation {
		if (animationName == null) throw new ArgumentError("animationName cannot be null.");
		for each (var animation:Animation in animations)
			if (animation.name == animationName) return animation;
		return null;
	}
	
	// --- IK constraints.

	/** @return May be null. */
	public function findIkConstraint (ikConstraintName:String) : IkConstraintData {
		if (ikConstraintName == null) throw new ArgumentError("ikConstraintName cannot be null.");
		for each (var ikConstraintData:IkConstraintData in ikConstraints)
			if (ikConstraintData._name == ikConstraintName) return ikConstraintData;
		return null;
	}

	// ---

	public function toString () : String {
		return name != null ? name : super.toString();
	}
}

}
