cask "binlogviz" do
  version "0.35.2"

  on_macos do
    on_intel do
      sha256 "6d48b2cab308c4cabec3f84a95895eb534df132d0decb667bdab226c18886f5e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.2/binlogviz_0.35.2_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "9fd7e9779a16f47ebc6dea92d09e97624ef2d1013d0dcdb23327f51c3846b9bc"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.2/binlogviz_0.35.2_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "212c3682c9d128cd59607258b1e45b67a2a4befec88fd16a6b47e069a2615f35"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.2/binlogviz_0.35.2_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "8ae0eb4d6b0fbb46963aead68c39122a2850456485582aa06b3f14469076a97e"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.2/binlogviz_0.35.2_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
