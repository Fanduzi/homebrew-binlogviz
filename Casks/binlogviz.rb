cask "binlogviz" do
  version "0.23.4"

  on_macos do
    on_intel do
      sha256 "0a0909df6d12d09fecd2f65471aeb2f07a158ced7de85797caba5bfeca2a4d1e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.4/binlogviz_0.23.4_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "387e80e959291a27e8b71335c9ac66903f4ce8d0779b369c4a3c5d5bf6580f10"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.4/binlogviz_0.23.4_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "1f20afc2b8ae9f7c5ecdad439dd1607361366dfb0baa1bd814d22cd37afab87c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.4/binlogviz_0.23.4_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "10a9d1b011271e86cbf24d9c24e0df743cfd71c731176d0fae650d3ac17487dc"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.4/binlogviz_0.23.4_linux_arm64.tar.gz",
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
